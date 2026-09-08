import Mathlib

-- Day18-09 大数定律 ε 化（概率进阶 · 表层 ε 化）
-- 大数定律：样本均值 X̄_n 收敛到期望 μ（当 n→∞）
-- 偏元 ε 化：平均动作带留差 ε，样本均值收敛到 μ + ε（大数定律的偏元版）

def sample_mean_ε (μ ε : ℝ) : ℝ := μ + ε

-- 定理1：退化锚——ε=0 时样本均值收敛到经典期望
theorem lln_degenerate (μ : ℝ) : sample_mean_ε μ 0 = μ := by
  unfold sample_mean_ε
  ring

-- 定理2：非平凡——ε≠0 时样本均值偏移（平均动作带留差）
theorem lln_residue {μ ε : ℝ} (hε : ε ≠ 0) : sample_mean_ε μ ε ≠ μ := by
  unfold sample_mean_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——样本均值的偏移 = ε
theorem lln_offset (μ ε : ℝ) : sample_mean_ε μ ε - μ = ε := by
  unfold sample_mean_ε
  ring
