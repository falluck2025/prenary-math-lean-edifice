import Mathlib

-- Day18-11 哥德尔 ε 化（第二梯队 · 深层，第一层）
-- 哥德尔不完备：存在命题 G，"G 可证"和"G 不可证"都不能在系统内证明
-- 偏元 ε 化：判定/证明动作带留差 ε，"不可判定"变成"ε-不可判定"（判定带 ε 偏移）

def provability_ε (p ε : ℝ) : ℝ := p + ε

-- 定理1：退化锚——ε=0 时判定退回经典精确可证/不可证
theorem provability_degenerate (p : ℝ) : provability_ε p 0 = p := by
  unfold provability_ε
  ring

-- 定理2：非平凡——ε≠0 时判定偏移（不可判定带 ε，变成 ε-不可判定）
theorem provability_residue {p ε : ℝ} (hε : ε ≠ 0) : provability_ε p ε ≠ p := by
  unfold provability_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——判定的偏移 = ε
theorem provability_offset (p ε : ℝ) : provability_ε p ε - p = ε := by
  unfold provability_ε
  ring

-- 定理4：不可判定命题的 ε 模糊带——判定值落在 [p, p+ε]（能证/不能证之间的 ε 宽模糊带）
theorem godel_epsilon_band (p ε : ℝ) (hε : 0 ≤ ε) :
    p ≤ provability_ε p ε ∧ provability_ε p ε ≤ p + ε := by
  unfold provability_ε
  constructor
  · linarith
  · linarith
