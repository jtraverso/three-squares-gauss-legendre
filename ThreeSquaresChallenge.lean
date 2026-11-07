/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib.Algebra.BigOperators.Fin

/-!
# The three squares theorem (Gauss–Legendre)

A natural number is a sum of three squares if and only if it is not of the form `4^a (8 b + 7)`
(A.-M. Legendre, *Essai sur la théorie des nombres*, 1798; C. F. Gauss, *Disquisitiones
Arithmeticae*, 1801, art. 291–292).

* `sum_three_sq_iff`: the theorem, for natural numbers.
* `exists_sum_sq_of_mod_eight_eq_three`: every `n ≡ 3 (mod 8)` is `x₀² + x₁² + x₂²` with
  `x : Fin 3 → ℤ`.
-/

@[expose] public section

namespace GaussLegendre

/-- **The three squares theorem (Gauss–Legendre).** -/
theorem sum_three_sq_iff (n : ℕ) :
    (∃ x y z : ℕ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔ ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7) := by
  sorry

/-- Every `n ≡ 3 (mod 8)` is a sum of three integer squares. -/
theorem exists_sum_sq_of_mod_eight_eq_three (n : ℕ) (hn : n % 8 = 3) :
    ∃ x : Fin 3 → ℤ, ∑ i, x i ^ 2 = n := by
  sorry

end GaussLegendre
