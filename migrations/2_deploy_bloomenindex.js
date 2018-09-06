// File: `./migrations/2_deploy_bloomenindex.js`

var BloomenIndex = artifacts.require("BloomenIndex");

module.exports = function(deployer) {
deployer.deploy(BloomenIndex)
};
