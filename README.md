# Decentralized Newsletter (Token-Gated)

A professional-grade implementation for decentralized publishing. This repository enables creators to build a "Web3 Substack" where access to content is governed by on-chain asset ownership. It includes a "Tip Jar" logic that allows readers to support the creator directly without platform fees.

## Core Features
* **Balance-Based Access:** Frontend logic to verify `balanceOf(user) > threshold` before revealing content.
* **Subscription Tiers:** Support for multiple ERC-20 tokens as "Access Passes."
* **Direct Monetization:** Integrated "Donate" function for frictionless reader support.
* **Flat Architecture:** Single-directory layout for the Gating logic and the Creator Treasury.

## Workflow
1. **Setup:** Creator deploys the contract and specifies the required token and minimum balance.
2. **Read:** User attempts to access a newsletter post.
3. **Verify:** The dApp checks the user's wallet for the required token.
4. **Unlock:** If verified, the encrypted content is decrypted or fetched from a private IPFS node.

## Setup
1. `npm install`
2. Deploy `NewsletterGater.sol` with your chosen ERC-20 address.
