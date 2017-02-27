var { Clone, Reset } = require('nodegit');
var fs = require('fs');

var packages = fs.readFileSync('./package.json').toString();
packages = JSON.parse(packages)['vim-dependencies'];

ensureBundleExists();
var packageResults = packages.map(installPackage);

packageResults = packageResults.reduce((final, res, index) => {
  if (res) {
    final.installing.push({promise: res, url: packages[index]});
  } else {
    final.finished.push({url: packages[index]});
  }
  return final;
}, {installing: [], finished: []});

if (packageResults.finished.length) {
  console.log('The following packages are already installed:');
  packageResults.finished.forEach(obj => console.log(getPackageName(obj.url)));
}

if (packageResults.installing.length) {
  console.log('\nInstalling the following packages:');
  packageResults.installing.forEach(obj => console.log(getPackageName(obj.url)));

  var allPromises = packageResults.installing.map(obj => obj.promise);

  Promise.all(allPromises)
    .then(() => console.log('All packages installed'));
} else {
  console.log('All packages installed')
}


function packageIsInstalled(url) {
  var packageName = getPackageName(url);
  try { 
    fs.accessSync('./bundle/' + packageName);
    return true;
  } catch (e) {
    return false;
  };
}

function getPackageName(url) {
  var pathArr = url.split('/');
  return pathArr[pathArr.length - 1];
}

function installPackage(url) {
  let commit;
  if (url.includes('#')) ({url, commit} = parseUrl(url))
  if (packageIsInstalled(url)) {
    return false;
  }
  return Clone(url, './bundle/' + getPackageName(url))
    .then(repo => {
      if (!commit) return repo
      console.log(`On ${getPackageName(url)}, checking out commit: ${commit}`)
      return repo.getCommit(commit)
        .then(gitCommit => {
          return Reset.reset(repo, gitCommit, Reset.TYPE.HARD)
        })
    })
}

function parseUrl(url) {
  [url, commit] = url.split('#')
  return {url, commit}
}

function ensureBundleExists() {
  try {
    fs.accessSync('./bundle');
    return false;
  } catch (e) {
    fs.mkdirSync('./bundle');
    return true;
  }
}
