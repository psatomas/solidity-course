import { network } from "hardhat";

async function main() {
  const { viem } = await network.connect({
    network: "hardhatOp",
    chainType: "op",
  });

  const [client] = await viem.getWalletClients();

  console.log("Sender:", client.account.address);

  const hash = await client.sendTransaction({
    to: client.account.address,
    value: 1n,
  });

  console.log("Tx hash:", hash);
}

main().catch(console.error);



