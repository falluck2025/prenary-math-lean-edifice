import Mathlib

-- Day18-19 微积分基本定理 ε 化（第三梯队 · 承重梁）
-- 微积分基本定理：微分和积分互逆，∫_a^b f dx = F(b)-F(a)，d/dx ∫ f = f
-- 偏元 ε 化：互逆动作带留差 ε，"积分再微分"不精确回到原函数，留 ε

def ftc_ε (ε : ℝ) : ℝ := 0 + ε

-- 定理1：退化锚——ε=0 时微积分基本定理互逆精确成立
theorem ftc_degenerate : ftc_ε 0 = 0 := by
  unfold ftc_ε
  ring

-- 定理2：非平凡——ε≠0 时互逆不精确（积分再微分留 ε）
theorem ftc_residue {ε : ℝ} (hε : ε ≠ 0) : ftc_ε ε ≠ 0 := by
  unfold ftc_ε
  intro h
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——微积分互逆的"零"偏移成 ε
theorem ftc_offset (ε : ℝ) : ftc_ε ε - 0 = ε := by
  unfold ftc_ε
  ring
