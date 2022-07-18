const Refund = artifacts.require("Refund");

module.exports = function (deployer,network, accounts) {
  deployer.deploy(Refund , [accounts[0],accounts[1]]);
};
