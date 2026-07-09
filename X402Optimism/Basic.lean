-- x402-Optimism Basic | Author: Richard Patterson (@De-ASI-INTERFACE)
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace X402Optimism

/-- Payment authorization struct for OP Mainnet x402 gates -/
structure PaymentAuth where
  nonce      : Nat
  amount     : Nat
  expires_at : Nat
  deriving Repr, DecidableEq

/-- Facilitator contract state -/
structure FacilitatorState where
  used_nonces : Finset Nat
  block_time  : Nat
  deriving Repr

/-- A payment auth is valid iff its nonce is unused and not yet expired -/
def verify (a : PaymentAuth) (s : FacilitatorState) : Prop :=
  a.nonce ∉ s.used_nonces ∧ s.block_time ≤ a.expires_at

/-- Replay prevention: verified payment nonce cannot already be in used set -/
theorem optimism_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s)
    : a.nonce ∉ s.used_nonces := h.1

/-- Expiry: verified payment block_time is within expiry window -/
theorem optimism_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s)
    : s.block_time ≤ a.expires_at := h.2

end X402Optimism
