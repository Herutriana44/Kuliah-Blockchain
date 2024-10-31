require("@nomicfoundation/hardhat-toolbox");
require("./tasks/block-number");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "ganache",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        `0xfd834729ff275ab13dde03221ae8bd7ac353ca76516e9accacc0f98c0ce448ca`
      ],
      chainId: 1337,
    }
  },
  solidity: "0.8.19",
};

// npx hardhat run ./test/deploy.js --network gananche