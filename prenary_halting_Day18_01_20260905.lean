import Mathlib

-- Day18-01 停机 ε-可判定（表层 ε 化）
-- 经典停机判定：H(P)=1（停机）或 0（不停机），精确二值，图灵证明不可判定
-- 偏元 ε 化：判定这个"动作"带留差 ε，H_ε(P) = H(P) + ε
-- "ε-可判定" = 判定结果带 ε 偏移（不再是精确二值，是带留差的近似判定）

def halting_judge (h ε : ℝ) : ℝ := h + ε

-- 定理1：退化锚——ε=0 时偏元判定退回经典精确判定
theorem halting_degenerate (h : ℝ) : halting_judge h 0 = h := by
  unfold halting_judge
  ring

-- 定理2：非平凡——ε≠0 时判定偏移（判定带留差，不再是精确二值）
theorem halting_residue {h ε : ℝ} (hε : ε ≠ 0) : halting_judge h ε ≠ h := by
  unfold halting_judge
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——偏元判定的偏移 = ε（"ε-可判定"的 ε 就是这个偏移）
theorem halting_offset (h ε : ℝ) : halting_judge h ε - h = ε := by
  unfold halting_judge
  ring
