import Mathlib

-- Day18-10 选择公理 ε 化（集合论 · 表层 ε 化）
-- 选择公理：任意非空集合族存在选择函数（从每个集合挑一个元素）
-- 偏元 ε 化：选择这个"动作"带留差 ε，选择结果带 ε 偏移

def choice_ε (c ε : ℝ) : ℝ := c + ε

-- 定理1：退化锚——ε=0 时选择退回经典精确选择
theorem choice_degenerate (c : ℝ) : choice_ε c 0 = c := by
  unfold choice_ε
  ring

-- 定理2：非平凡——ε≠0 时选择偏移（选择动作带留差）
theorem choice_residue {c ε : ℝ} (hε : ε ≠ 0) : choice_ε c ε ≠ c := by
  unfold choice_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——选择的偏移 = ε
theorem choice_offset (c ε : ℝ) : choice_ε c ε - c = ε := by
  unfold choice_ε
  ring
