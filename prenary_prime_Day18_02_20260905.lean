import Mathlib

-- Day18-02 素数 ε 化（表层 ε 化，只焊结构不焊拟合值）
-- 素数间隔 g = p_{n+1} - p_n（经典，精确）
-- 偏元 ε 化：素数间隔带留差 ε，g_ε = g + ε（素数分布的"呼吸"）

def prime_gap_ε (g ε : ℝ) : ℝ := g + ε

-- 定理1：退化锚——ε=0 时素数间隔退回经典精确间隔
theorem prime_gap_degenerate (g : ℝ) : prime_gap_ε g 0 = g := by
  unfold prime_gap_ε
  ring

-- 定理2：非平凡——ε≠0 时素数间隔偏移（间隔带留差，素数分布"呼吸"）
theorem prime_gap_residue {g ε : ℝ} (hε : ε ≠ 0) : prime_gap_ε g ε ≠ g := by
  unfold prime_gap_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——素数间隔的呼吸偏移 = ε
theorem prime_gap_offset (g ε : ℝ) : prime_gap_ε g ε - g = ε := by
  unfold prime_gap_ε
  ring

-- 定理4：孪生素数间隔 ε 化——孪生素数差 2，偏元下差 2+ε（孪生素数"呼吸"）
theorem twin_prime_gap (ε : ℝ) : prime_gap_ε 2 ε = 2 + ε := by
  unfold prime_gap_ε
  ring
