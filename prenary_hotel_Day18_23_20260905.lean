import Mathlib

-- Day18-23 希尔伯特旅馆 ε 化（第四梯队 · 悖论，第一层）
-- 希尔伯特旅馆：无穷房间满员，移动客人腾出空房（可数无穷 + 1 = 可数无穷）
-- 偏元 ε 化：移动客人动作带留差 ε，"腾房间"带 ε 偏移

def hotel_ε (h ε : ℝ) : ℝ := h + ε

-- 定理1：退化锚——ε=0 时移动退回经典（可数无穷 + 1 = 可数无穷）
theorem hotel_degenerate (h : ℝ) : hotel_ε h 0 = h := by
  unfold hotel_ε
  ring

-- 定理2：非平凡——ε≠0 时移动偏移（移动客人带留差）
theorem hotel_residue {h ε : ℝ} (hε : ε ≠ 0) : hotel_ε h ε ≠ h := by
  unfold hotel_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——移动的偏移 = ε
theorem hotel_offset (h ε : ℝ) : hotel_ε h ε - h = ε := by
  unfold hotel_ε
  ring
