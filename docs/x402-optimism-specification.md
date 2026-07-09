# x402-Optimism Specification
**Author:** Richard Patterson | **Ref:** RP-DEASI-OP-2026-0709-001

## Payment Schema (`scheme: optimism-erc20`)
```json
{ "scheme": "optimism-erc20", "chainId": 10,
  "payTo": "0x<facilitator>", "token": "0x<erc20-or-eth>",
  "amount": "<uint256>", "nonce": "<bytes32>",
  "expiresAt": "<unix-timestamp>",
  "signature": "<eip712-sig>" }
```

## Optimism-Specific Invariants
1. **Velodrome v2 CL Pools:** Concentrated liquidity routing with tick-range payment gates
2. **Superchain Interop:** `L2ToL2CrossDomainMessenger` relay for cross-OP-Stack payment gates
3. **OP Stack Sequencer:** 2s block time; payment confirmed before resource delivery
4. **EIP-1559 Base Fee:** Deterministic fee calculation on OP Mainnet
5. **Fault Proof Window:** 7-day L1 settlement; L2 finality within 2 blocks
