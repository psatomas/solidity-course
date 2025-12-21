import { network } from "hardhat";
import type { Abi } from "viem";
import fs from "fs";
import path from "path";

async function main() {
  const artifactPath = path.resolve(
    "artifacts/contracts/SampleDebugging.sol/MyContract.json"
  );

  const artifact = JSON.parse(fs.readFileSync(artifactPath, "utf8"));
  const abi = artifact.abi as Abi;

  const { viem } = await network.connect({
    network: "hardhat",
    chainType: "l1",
  });

  const [walletClient] = await viem.getWalletClients();
  const publicClient = await viem.getPublicClient();

  const contractAddress = "0xREPLACE_WITH_DEPLOYED_ADDRESS" as `0x${string}`;

  const initialValue = await publicClient.readContract({
    address: contractAddress,
    abi,
    functionName: "myUint",
  });

  console.log("Initial value:", initialValue);

  const txHash = await walletClient.writeContract({
    address: contractAddress,
    abi,
    functionName: "setMyUint",
    args: [345n],
  });

  await publicClient.waitForTransactionReceipt({ hash: txHash });

  const updatedValue = await publicClient.readContract({
    address: contractAddress,
    abi,
    functionName: "myUint",
  });

  console.log("Updated value:", updatedValue);
}

main().catch(console.error);

