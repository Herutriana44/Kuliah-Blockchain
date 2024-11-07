require("@nomicfoundation/hardhat-toolbox");
// require("./tasks/block-number");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "ganache",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        `0x8acbca1ff5f3468bbe2c799d503b0a35bcfe8ad873b3c3bbf711ce677928261e`
      ],
      chainId: 1337,
    }
  },
  solidity: "0.8.19",
};

// hasil deploy 0x4e7288cC93Debe8B6C2A0a502a24df99D74a00fF date = 07112024

// npx hardhat run ./test/deploy.js --network ganache