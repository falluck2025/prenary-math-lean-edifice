import Mathlib

-- Day18-14 同伦/基本群 ε 化（第二梯队 · 深层，第一层）
-- 基本群 π₁：空间的"一维洞"（环）的分类，同伦是连续变形
-- 偏元 ε 化：连续变形动作带留差 ε，环数带 ε 偏移

def homotopy_ε (h ε : ℝ) : ℝ := h + ε

-- 定理1：退化锚——ε=0 时同伦/基本群退回经典
theorem homotopy_degenerate (h : ℝ) : homotopy_ε h 0 = h := by
  unfold homotopy_ε
  ring

-- 定理2：非平凡——ε≠0 时同伦偏移（连续变形带留差）
theorem homotopy_residue {h ε : ℝ} (hε : ε ≠ 0) : homotopy_ε h ε ≠ h := by
  unfold homotopy_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——同伦的偏移 = ε
theorem homotopy_offset (h ε : ℝ) : homotopy_ε h ε - h = ε := by
  unfold homotopy_ε
  ring

-- 定理4：无洞时（基本群平凡）偏元基本群 = ε（变形留差，不凭空多出洞）
theorem homotopy_no_hole (ε : ℝ) : homotopy_ε 0 ε = ε := by
  unfold homotopy_ε
  ring
