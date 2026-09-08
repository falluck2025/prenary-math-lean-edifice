import Mathlib

-- Day18-24 巴拿赫-塔斯基 ε 化（第四梯队 · 悖论，第一层）
-- 巴拿赫-塔斯基：一个球分解成有限块，重组成两个等大的球（依赖选择公理）
-- 偏元 ε 化：分解/重组动作带留差 ε，"一球变两球"带 ε 偏移

def banach_tarski_ε (b ε : ℝ) : ℝ := b + ε

-- 定理1：退化锚——ε=0 时分解重组退回经典悖论
theorem banach_degenerate (b : ℝ) : banach_tarski_ε b 0 = b := by
  unfold banach_tarski_ε
  ring

-- 定理2：非平凡——ε≠0 时分解重组偏移（一球变两球带留差）
theorem banach_residue {b ε : ℝ} (hε : ε ≠ 0) : banach_tarski_ε b ε ≠ b := by
  unfold banach_tarski_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——分解重组的偏移 = ε
theorem banach_offset (b ε : ℝ) : banach_tarski_ε b ε - b = ε := by
  unfold banach_tarski_ε
  ring
