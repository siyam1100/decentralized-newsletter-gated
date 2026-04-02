const hre = require("hardhat");

async function main() {
  const TOKEN_ADDRESS = "0x..."; // Your community token
  const THRESHOLD = hre.ethers.parseUnits("100", 18); // 100 Tokens to read

  const Gater = await hre.ethers.getContractFactory("NewsletterGater");
  const gater = await Gater.deploy(TOKEN_ADDRESS, THRESHOLD);

  await gater.waitForDeployment();
  console.log("Newsletter Gater deployed to:", await gater.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
