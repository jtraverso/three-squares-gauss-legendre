# The three squares theorem (Gauss–Legendre) in Lean 4

Author and maintainer: **Juan Pablo Traverso Gianini**. Licence: Apache-2.0 (see `LICENSE`).

A Lean 4 / Mathlib proof that a natural number is a sum of three squares if and only if it is not
of the form `4^a (8 b + 7)` (A.-M. Legendre, *Essai sur la théorie des nombres*, 1798;
C. F. Gauss, *Disquisitiones Arithmeticae*, 1801, art. 291–292). The theorem is not in Mathlib,
which has the two and four squares theorems.

## Statements (`ThreeSquaresChallenge.lean`, namespace `GaussLegendre`)

```lean
theorem sum_three_sq_iff (n : ℕ) :
    (∃ x y z : ℕ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔ ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7)

theorem exists_sum_sq_of_mod_eight_eq_three (n : ℕ) (hn : n % 8 = 3) :
    ∃ x : Fin 3 → ℤ, ∑ i, x i ^ 2 = n
```

## Proof (`ThreeSquaresLib/`)

The classical method of ternary quadratic forms of determinant one with Dirichlet's theorem on
primes in arithmetic progressions (see e.g. M. B. Nathanson, *Additive Number Theory: The Classical
Bases*, Chapter 1), with the reduction of unimodular forms proved by Minkowski's convex body
theorem.

1. `Minkowski.lean`: a positive definite integral ternary form of determinant at most `2` takes a
   value smaller than `2` at a nonzero integer vector. The ellipsoid `{q < 2}` is the preimage of a
   Euclidean ball under the linear map of the `LDLᵀ` decomposition; its volume is at least
   `8π/3 > 8` (Mathlib's `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and
   `volume_sum_rpow_lt`).
2. `Unimodular.lean`: a positive definite integral ternary form `A` of determinant `1` is `Pᵀ P`. A
   vector `v₁` with `q(v₁) = 1` comes from step 1; step 1 applied to the form
   `q(x) + B(v₁, x)²` (determinant `2`) gives `v₂` with `q(v₂) = 1` and `B(v₁, v₂) = 0`; the vector
   `adj(A) (v₁ × v₂)` completes an orthonormal basis.
3. `Construct.lean`: if `a ≥ 1`, `d = a n − 1 > 0` and `d ∣ 1 + n b²`, the matrix
   `[[a, b, 1], [b, (1 + n b²)/d, 0], [1, 0, n]]` is positive definite of determinant `1`, so `n`
   is a sum of three squares.
4. `Arith.lean`: such `a, b` exist for `n ≢ 0 (mod 4)`, `n ≢ 7 (mod 8)`. Take a prime `p` in a
   residue class modulo `4n` (Dirichlet's theorem, `Nat.forall_exists_prime_gt_and_zmodEq`) with
   `n ∣ p + 1` (cases `n ≡ 1, 2 (mod 4)`, `d = p`) or `n ∣ 2p + 1` (case `n ≡ 3 (mod 8)`,
   `d = 2p`); quadratic reciprocity for the Jacobi symbol makes `−n` a square modulo `p`.
5. `Main.lean`: necessity (squares are `0, 1, 4 (mod 8)`; a sum of three squares divisible by `4`
   has even terms) and removal of the factors `4`.

## Checking

```
lake build ThreeSquaresChallenge ThreeSquaresSolution
```

`ThreeSquaresChallenge.lean` states the results (with `sorry`) using only Mathlib;
`ThreeSquaresSolution.lean` imports the proofs. `comparator.json` lists the compared theorems;
`MATHLIB_DEFINITIONS.md` excerpts the Mathlib definitions used in the statements.

## AI disclosure

The Lean development was written by an AI agent (Claude Opus 5.5 in Claude Code) under the
author's direction, and mechanically verified (no `sorry`; axioms `propext`, `Classical.choice`,
`Quot.sound`).
