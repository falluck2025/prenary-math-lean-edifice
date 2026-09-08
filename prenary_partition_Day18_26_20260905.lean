import Mathlib

-- Day18-26 配分函数 ε 化（第四梯队 · 物理 E，第一层）
-- 配分函数 Z = Σ e^{-βE_i}：统计力学的核心，物理量都由 Z 推出
-- 偏元 ε 化：统计求和动作带留差 ε，Z_ε = Z + ε（配分函数留差）

def partition_ε (z ε : ℝ) : ℝ := z + ε

-- 定理1：退化锚——ε=0 时配分函数退回经典统计力学
theorem partition_degenerate (z : ℝ) : partition_ε z 0 = z := by
  unfold partition_ε
  ring

-- 定理2：非平凡——ε≠0 时配分函数偏移（统计求和带留差）
theorem partition_residue {z ε : ℝ} (hε : ε ≠ 0) : partition_ε z ε ≠ z := by
  unfold partition_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——配分函数的偏移 = ε
theorem partition_offset (z ε : ℝ) : partition_ε z ε - z = ε := by
  unfold partition_ε
  ring
