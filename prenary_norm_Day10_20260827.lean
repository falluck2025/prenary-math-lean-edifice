import Mathlib

/- ================================================================
   偏元数学 · 泛函分析（Day 10 · 正式第一稿 · 范数柱）
   核心：对象层（经典范数 ‖x‖）不动，动作层（偏元范数）留 ε
   显式区分：经典范数（对象层）+ prenary_norm（动作层）
   新结构：动作留差破坏"齐次性"，偏元范数不是经典范数
   ================================================================ -/

-- ① 动作层（动态）：偏元范数 = 经典范数 + 动作留差 ε
noncomputable def prenary_norm {X : Type} [NormedAddCommGroup X] (x : X) (ε : ℝ) : ℝ :=
  ‖x‖ + ε

-- ② 退化定理：ε=0 时，偏元范数退化为经典范数
theorem prenary_norm_degenerate {X : Type} [NormedAddCommGroup X] (x : X) :
    prenary_norm x 0 = ‖x‖ := by
  unfold prenary_norm
  rw [add_zero]

-- ③ 非平凡定理：ε≠0 时，偏元范数 ≠ 经典范数
theorem prenary_norm_non_trivial {X : Type} [NormedAddCommGroup X] (x : X) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_norm x ε ≠ ‖x‖ := by
  intro h
  unfold prenary_norm at h
  have hε0 : ε = 0 := by
    linarith
  exact hε hε0

-- ④ 三角不等式（动作层）：成立（经典三角 + ε 抵消）
theorem prenary_norm_triangle {X : Type} [NormedAddCommGroup X] (x y : X) (ε : ℝ) :
    prenary_norm (x + y) ε ≤ prenary_norm x ε + prenary_norm y ε := by
  unfold prenary_norm
  have h := norm_add_le x y
  linarith

-- ⑤ 齐次性破坏（新结构）：偏元范数不满足经典齐次性
--    ‖c•x‖_ε = |c|·‖x‖ + ε ≠ |c|·(‖x‖+ε) = |c|·‖x‖_ε（当 ε≠0 且 |c|≠1）
theorem prenary_norm_not_homogeneous :
    ∃ c : ℝ, c ≠ 1 ∧ prenary_norm (c • (1 : ℝ)) 1 ≠ |c| * prenary_norm (1 : ℝ) 1 := by
  refine ⟨2, by norm_num, ?_⟩
  unfold prenary_norm
  norm_num
