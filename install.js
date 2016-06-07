var Git = require('nodegit');
var fs = require('fs');

var packages = fs.readFileSync('./package.json').toString();
packages = JSON.parse(packages)['vim-dependencies'];

ensureBundleExists();
packages.forEach(installPackage);

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
  if (packageIsInstalled(url)) return;
  Git.Clone(url, './bundle/' + getPackageName(url));
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
