import Mathlib

-- Day18-05 留数 ε 化（表层 ε 化）
-- 留数 Res(f,a)：亚纯函数 f 在奇点 a 处的"残留"，围道积分 = 2πi·Σ Res
-- 偏元 ε 化：计算留数动作带留差 ε，Res_ε = Res + ε

def residue_ε (res ε : ℝ) : ℝ := res + ε

-- 定理1：退化锚——ε=0 时留数退回经典
theorem residue_degenerate (res : ℝ) : residue_ε res 0 = res := by
  unfold residue_ε
  ring

-- 定理2：非平凡——ε≠0 时留数偏移（算留数带留差）
theorem residue_residue {res ε : ℝ} (hε : ε ≠ 0) : residue_ε res ε ≠ res := by
  unfold residue_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——留数的偏移 = ε
theorem residue_offset (res ε : ℝ) : residue_ε res ε - res = ε := by
  unfold residue_ε
  ring
