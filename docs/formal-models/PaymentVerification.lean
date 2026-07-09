-- x402-Optimism Payment Verification | Author: Richard Patterson
import X402Optimism.Basic

namespace X402Optimism.Verification

/-- Settlement: after verification, record nonce to prevent replay -/
def settle (a : PaymentAuth) (s : FacilitatorState)
    (h : verify a s) : FacilitatorState :=
  { s with used_nonces := s.used_nonces ∪ {a.nonce} }

/-- Post-settlement, the nonce is recorded in used set -/
theorem settled_nonce_recorded
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s)
    : a.nonce ∈ (settle a s h).used_nonces := by
  simp [settle, Finset.mem_union, Finset.mem_singleton]

end X402Optimism.Verification
