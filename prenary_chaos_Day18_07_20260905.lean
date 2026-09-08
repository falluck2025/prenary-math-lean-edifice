import Mathlib

-- Day18-07 混沌门槛 r_c(ε) 化（表层 ε 化）
-- 混沌门槛 r_c：Logistic 映射 x_{n+1}=r·x_n(1-x_n) 进入混沌的参数阈值（≈3.5699）
-- 偏元 ε 化：迭代动作带留差 ε，门槛偏移 r_c(ε) = r_c + ε

def chaos_threshold_ε (rc ε : ℝ) : ℝ := rc + ε

-- 定理1：退化锚——ε=0 时混沌门槛退回经典
theorem chaos_degenerate (rc : ℝ) : chaos_threshold_ε rc 0 = rc := by
  unfold chaos_threshold_ε
  ring

-- 定理2：非平凡——ε≠0 时混沌门槛偏移
theorem chaos_residue {rc ε : ℝ} (hε : ε ≠ 0) : chaos_threshold_ε rc ε ≠ rc := by
  unfold chaos_threshold_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——混沌门槛的偏移 = ε
theorem chaos_offset (rc ε : ℝ) : chaos_threshold_ε rc ε - rc = ε := by
  unfold chaos_threshold_ε
  ring

-- 定理4：门槛偏移方向——ε>0 时门槛变大（混沌"推迟"到来）
theorem chaos_threshold_increases (rc ε : ℝ) (hε : 0 < ε) : rc < chaos_threshold_ε rc ε := by
  unfold chaos_threshold_ε
  linarith
