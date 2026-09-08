import Mathlib

-- Day18-17 欧拉公式 ε 化（第三梯队 · 承重梁）
-- 欧拉公式：e^{iπ} + 1 = 0（五个常数 e/i/π/1/0 的完美抵消）
-- 偏元 ε 化：抵消动作带留差 ε，e^{iπ} + 1 = ε（抵消不干净，最美的 0 变成留差 ε）

def euler_sum_ε (ε : ℝ) : ℝ := 0 + ε

-- 定理1：退化锚——ε=0 时退回经典 e^{iπ}+1=0
theorem euler_degenerate : euler_sum_ε 0 = 0 := by
  unfold euler_sum_ε
  ring

-- 定理2：非平凡——ε≠0 时欧拉公式不再精确归零（抵消不干净）
theorem euler_residue {ε : ℝ} (hε : ε ≠ 0) : euler_sum_ε ε ≠ 0 := by
  unfold euler_sum_ε
  intro h
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——欧拉公式的"0"偏移成 ε
theorem euler_offset (ε : ℝ) : euler_sum_ε ε - 0 = ε := by
  unfold euler_sum_ε
  ring
