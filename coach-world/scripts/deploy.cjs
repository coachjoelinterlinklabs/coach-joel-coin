async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const CJC = await ethers.getContractFactory("CJC");
  const cjc = await CJC.deploy();
  await cjc.waitForDeployment();
  console.log("CJC deployed at:", await cjc.getAddress());

  const Staking = await ethers.getContractFactory("Staking");
  const staking = await Staking.deploy(await cjc.getAddress());
  await staking.waitForDeployment();
  console.log("Staking deployed at:", await staking.getAddress());
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
