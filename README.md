# 🏰 Coach World – $CJC Coin

![Coach World Logo](https://via.placeholder.com/250x80.png?text=Coach+World+Logo)  

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)  
[![Solana Devnet](https://img.shields.io/badge/Blockchain-Solana%20Devnet-blue)](https://solana.com/)  
[![Web Test](https://img.shields.io/badge/Web-Test-GitHub%20Pages-orange)](https://pages.github.com/)

$CJC Coin will be available on **InterLink Layer 1 blockchain**. Coach World is a **Clash-of-Clans-style blockchain game** where players **train mentors, build bases, complete quests, battle other players, and earn $CJC rewards**.

> [!NOTE]
> If you're new to blockchain games, you don’t need to deploy a full smart contract just to test $CJC or mint NFTs. Use the Solana Devnet and existing programs for token management, NFT minting, and transactions.

---

## ⚡ Features Overview

Each folder in this repo contains examples and starter scripts for one or more of the following features:

- `$CJC Token` – Coach Joel Coin, the stable in-game currency.  
- `Mentor NFTs` – Mint, upgrade, and trade mentor NFTs.  
- `Marketplace` – Buy/sell mentors using $CJC.  
- `Base Building` – Build and upgrade your academy/base.  
- `Staking & Rewards` – Stake $CJC and earn rewards.  
- `Web & Unity Integration` – Web demo via React.js and optional Unity WebGL gameplay.

---

## 🪄 $CJC Token

<details>
  <summary>Details & Starter Examples</summary>

$CJC is the core currency of Coach World. It can be earned in-game, staked, or used in the marketplace.  

Starter scripts for minting and transferring $CJC:

- **Mint $CJC (Anchor)**: [anchor](./blockchain/cjc/anchor)  
- **Mint $CJC (Native Rust)**: [native](./blockchain/cjc/native)  
- **Transfer $CJC**: [anchor](./blockchain/cjc/transfer-anchor) [native](./blockchain/cjc/transfer-native)

</details>

---

## 🧑‍🏫 Mentor NFTs

<details>
  <summary>Mint, upgrade, and trade mentor NFTs</summary>

Mentors have unique skills and rarity. You can mint them using the **Metaplex Token Metadata Program**.

- **NFT Minter (Anchor)**: [anchor](./blockchain/mentor-nft/anchor)  
- **NFT Minter (Native)**: [native](./blockchain/mentor-nft/native)  

Attributes can include: level, skill, rarity, and base assignment.  

</details>

---

## 🏠 Base Building

<details>
  <summary>Build and upgrade your academy/base</summary>

Bases include training halls, gyms, libraries, and resource generators.

- Upgrade scripts for base expansions: [anchor](./unity_game/base-upgrade/anchor)  
- Optional Unity WebGL prefab examples: [unity](./unity_game/Prefabs)  

</details>

---

## 💰 Marketplace & Staking

<details>
  <summary>Buy/sell mentor NFTs and stake $CJC</summary>

- Web-based React marketplace: [frontend_marketplace](./frontend_marketplace)  
- Staking scripts (devnet simulation): [anchor](./blockchain/staking/anchor)  

Players can earn $CJC from quests, PvP battles, or staking.  

</details>

---

## ⚙️ Setup & Testing

<details>
  <summary>Instructions</summary>

### Frontend Web Test
```bash
cd frontend_marketplace
npm install
npm start
