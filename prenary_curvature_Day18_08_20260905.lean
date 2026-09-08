import Mathlib

-- Day18-08 曲率 ε 化（微分几何 · 表层 ε 化）
-- 曲率 κ：度量空间的弯曲程度（高斯曲率/黎曼曲率）
-- 偏元 ε 化：测曲率动作带留差 ε，κ_ε = κ + ε

def curvature_ε (κ ε : ℝ) : ℝ := κ + ε

-- 定理1：退化锚——ε=0 时曲率退回经典
theorem curvature_degenerate (κ : ℝ) : curvature_ε κ 0 = κ := by
  unfold curvature_ε
  ring

-- 定理2：非平凡——ε≠0 时曲率偏移（测曲率带留差）
theorem curvature_residue {κ ε : ℝ} (hε : ε ≠ 0) : curvature_ε κ ε ≠ κ := by
  unfold curvature_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——曲率的偏移 = ε
theorem curvature_offset (κ ε : ℝ) : curvature_ε κ ε - κ = ε := by
  unfold curvature_ε
  ring

-- 定理4：曲率符号保持——正曲率加正 ε 仍正（ε 不改变几何类型）
theorem curvature_sign_preserved (κ ε : ℝ) (hκ : 0 < κ) (hε : 0 < ε) :
    0 < curvature_ε κ ε := by
  unfold curvature_ε
  linarith
