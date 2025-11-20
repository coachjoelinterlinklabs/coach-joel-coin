import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("CJCModule", (m) => {
  const supply = m.getParameter("supply", 100_000_000_000); // 100B
  const cjc = m.contract("CJC", [supply]);
  return { cjc };
});
