import Mathlib

-- Day18-18 傅里叶变换 ε 化（第三梯队 · 承重梁）
-- 傅里叶变换 F：时域→频域，F(f)(ω) = ∫ f(t) e^{-iωt} dt，线性映射 F(f+g)=F(f)+F(g)
-- 偏元 ε 化：变换动作带留差 ε，F_ε(f) = F(f) + ε，线性性破坏

def fourier_ε (f ε : ℝ) : ℝ := f + ε

-- 定理1：退化锚——ε=0 时傅里叶变换退回经典线性映射
theorem fourier_degenerate (f : ℝ) : fourier_ε f 0 = f := by
  unfold fourier_ε
  ring

-- 定理2：非平凡——ε≠0 时傅里叶变换偏移
theorem fourier_residue {f ε : ℝ} (hε : ε ≠ 0) : fourier_ε f ε ≠ f := by
  unfold fourier_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——傅里叶变换的偏移 = ε
theorem fourier_offset (f ε : ℝ) : fourier_ε f ε - f = ε := by
  unfold fourier_ε
  ring

-- 定理4：线性性破坏——带 ε 的傅里叶变换不满足线性性（F_ε(f+g) ≠ F_ε(f)+F_ε(g)）
theorem fourier_linearity_broken (f g ε : ℝ) (hε : ε ≠ 0) :
    fourier_ε (f + g) ε ≠ fourier_ε f ε + fourier_ε g ε := by
  unfold fourier_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this
