require("hardhat");

module.exports = {
  solidity: "0.8.20",
  paths: {
    sources: "./contracts",
    scripts: "./scripts",
  },
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
    },
  },
};
