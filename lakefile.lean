import Lake
open Lake DSL

package «x402-optimism» where
  name := "x402-optimism"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «X402Optimism» where
  roots := #[`X402Optimism]
