import { network } from "hardhat";

async function main() {
  const connection = await network.connect({
    network: "hardhatOp",
    chainType: "op",
  });

  console.log("Available keys:", Object.keys(connection));
}

main().catch(console.error);


