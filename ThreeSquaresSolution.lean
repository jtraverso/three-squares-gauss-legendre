/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import ThreeSquaresLib.Main

/-!
# Proofs of the statements in `ThreeSquaresChallenge.lean`

The proofs are in `ThreeSquaresLib/` (namespace `ThreeSquares`): `Minkowski.lean` (a positive
definite integral ternary form of determinant at most `2` takes a value smaller than `2`, by
Minkowski's convex body theorem), `Unimodular.lean` (a positive definite integral ternary form of
determinant `1` is equivalent to `x² + y² + z²`), `Construct.lean` (a unimodular form with diagonal
entry `n`), `Arith.lean` (its parameters, from Dirichlet's theorem on primes in arithmetic
progressions and quadratic reciprocity for the Jacobi symbol) and `Main.lean`.
-/

@[expose] public section

namespace GaussLegendre

/-- **The three squares theorem (Gauss–Legendre).** -/
theorem sum_three_sq_iff (n : ℕ) :
    (∃ x y z : ℕ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔ ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7) :=
  ThreeSquares.sum_three_sq_iff n

/-- Every `n ≡ 3 (mod 8)` is a sum of three integer squares. -/
theorem exists_sum_sq_of_mod_eight_eq_three (n : ℕ) (hn : n % 8 = 3) :
    ∃ x : Fin 3 → ℤ, ∑ i, x i ^ 2 = n :=
  ThreeSquares.exists_sum_sq_of_mod_eight_eq_three n hn

end GaussLegendre
