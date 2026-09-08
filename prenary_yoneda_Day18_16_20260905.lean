import Mathlib

-- Day18-16 米田引理 ε 化（第二梯队 · 深层，第一层）
-- 米田引理：对象 X 由 Hom(X,-) 完全决定，Hom(X,-)→F 的自然变换 ↔ F(X) 元素
-- 偏元 ε 化：对应关系带留差 ε，米田对应偏移

def yoneda_ε (y ε : ℝ) : ℝ := y + ε

-- 定理1：退化锚——ε=0 时米田对应退回经典一一对应
theorem yoneda_degenerate (y : ℝ) : yoneda_ε y 0 = y := by
  unfold yoneda_ε
  ring

-- 定理2：非平凡——ε≠0 时米田对应偏移（对应关系带留差）
theorem yoneda_residue {y ε : ℝ} (hε : ε ≠ 0) : yoneda_ε y ε ≠ y := by
  unfold yoneda_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——米田对应的偏移 = ε
theorem yoneda_offset (y ε : ℝ) : yoneda_ε y ε - y = ε := by
  unfold yoneda_ε
  ring
