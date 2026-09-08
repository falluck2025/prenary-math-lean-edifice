import Mathlib

-- Day18-15 线性代数/表示论 ε 化（第二梯队 · 深层，第一层）
-- 线性变换 T：T(x+y) = T(x) + T(y)，T(c·x) = c·T(x)（线性性）
-- 偏元 ε 化：线性变换带留差 ε，T_ε(x) = T(x) + ε（线性性破坏，呼应 Day10）

def linear_map_ε (t ε : ℝ) : ℝ := t + ε

-- 定理1：退化锚——ε=0 时线性变换退回经典
theorem linear_degenerate (t : ℝ) : linear_map_ε t 0 = t := by
  unfold linear_map_ε
  ring

-- 定理2：非平凡——ε≠0 时线性变换偏移（线性性破坏）
theorem linear_residue {t ε : ℝ} (hε : ε ≠ 0) : linear_map_ε t ε ≠ t := by
  unfold linear_map_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——线性变换的偏移 = ε
theorem linear_offset (t ε : ℝ) : linear_map_ε t ε - t = ε := by
  unfold linear_map_ε
  ring

-- 定理4：线性性破坏——带 ε 的线性变换不满足线性性（T_ε(t1+t2) ≠ T_ε(t1)+T_ε(t2)）
theorem linearity_broken (t1 t2 ε : ℝ) (hε : ε ≠ 0) :
    linear_map_ε (t1 + t2) ε ≠ linear_map_ε t1 ε + linear_map_ε t2 ε := by
  unfold linear_map_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this
