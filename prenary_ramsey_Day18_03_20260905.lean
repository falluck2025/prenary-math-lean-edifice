import Mathlib

-- Day18-03 拉姆齐 ε 化（表层 ε 化）
-- 拉姆齐数 R(m,n)：最小数，使任意 R 个顶点二染色必有 m 红或 n 蓝完全子图
-- 偏元 ε 化：计数/选择动作带留差 ε，R_ε = R + ε（拉姆齐数偏移）

def ramsey_ε (r ε : ℝ) : ℝ := r + ε

-- 定理1：退化锚——ε=0 时拉姆齐数退回经典
theorem ramsey_degenerate (r : ℝ) : ramsey_ε r 0 = r := by
  unfold ramsey_ε
  ring

-- 定理2：非平凡——ε≠0 时拉姆齐数偏移（阈值带留差）
theorem ramsey_residue {r ε : ℝ} (hε : ε ≠ 0) : ramsey_ε r ε ≠ r := by
  unfold ramsey_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——拉姆齐阈值的偏移 = ε
theorem ramsey_offset (r ε : ℝ) : ramsey_ε r ε - r = ε := by
  unfold ramsey_ε
  ring
