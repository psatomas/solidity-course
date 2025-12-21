import "@nomicfoundation/hardhat-viem";

export default {
  solidity: "0.8.28",

  networks: {
    hardhat: {
      type: "edr-simulated",
      chainType: "l1",
    },
    hardhatOp: {
      type: "edr-simulated",
      chainType: "op",
    },
  },
};



