-- ============================================================
-- x402-Optimism: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: Optimism OP Mainnet / ERC-20 / Velodrome v2
--
-- Re-exports X402Optimism.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
-- ============================================================
import X402Optimism.PaymentVerification

namespace X402Optimism

/-- Alias: replay prevention under the Optimism chain prefix.
    result type: a.nonce ∉ s.used_nonces. -/
theorem optimism_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces :=
  replay_prevented a s h

/-- Alias: expiry enforcement under the Optimism chain prefix.
    Delegates to within_expiry: s.block_time ≤ a.expires_at. -/
theorem optimism_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time ≤ a.expires_at :=
  within_expiry a s h

end X402Optimism
