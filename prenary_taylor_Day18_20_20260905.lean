import Mathlib

-- Day18-20 泰勒展开 ε 化（第三梯队 · 承重梁）
-- 泰勒展开：f(x) = f(a) + f'(a)(x-a) + ...（多项式逼近光滑函数）
-- 偏元 ε 化：展开/逼近动作带留差 ε，泰勒逼近带 ε 误差

def taylor_ε (t ε : ℝ) : ℝ := t + ε

-- 定理1：退化锚——ε=0 时泰勒展开退回经典逼近
theorem taylor_degenerate (t : ℝ) : taylor_ε t 0 = t := by
  unfold taylor_ε
  ring

-- 定理2：非平凡——ε≠0 时泰勒逼近偏移
theorem taylor_residue {t ε : ℝ} (hε : ε ≠ 0) : taylor_ε t ε ≠ t := by
  unfold taylor_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——泰勒逼近的偏移 = ε
theorem taylor_offset (t ε : ℝ) : taylor_ε t ε - t = ε := by
  unfold taylor_ε
  ring
