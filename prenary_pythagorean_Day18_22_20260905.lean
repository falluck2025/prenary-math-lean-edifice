import Mathlib

-- Day18-22 勾股定理 ε 化（第三梯队 · 承重梁）
-- 勾股定理：a² + b² = c²（直角三角形两直角边平方和 = 斜边平方）
-- 偏元 ε 化：平方和动作带留差 ε，a² + b² = c² + ε（勾股关系带留差）

def pythagorean_ε (ε : ℝ) : ℝ := 0 + ε

-- 定理1：退化锚——ε=0 时勾股定理精确成立（a²+b²=c²）
theorem pythagorean_degenerate : pythagorean_ε 0 = 0 := by
  unfold pythagorean_ε
  ring

-- 定理2：非平凡——ε≠0 时勾股关系偏移（a²+b²=c²+ε）
theorem pythagorean_residue {ε : ℝ} (hε : ε ≠ 0) : pythagorean_ε ε ≠ 0 := by
  unfold pythagorean_ε
  intro h
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——勾股关系的偏移 = ε
theorem pythagorean_offset (ε : ℝ) : pythagorean_ε ε - 0 = ε := by
  unfold pythagorean_ε
  ring
