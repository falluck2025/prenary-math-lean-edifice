import Mathlib

-- Day18-13 混沌数值 ε 化（第二梯队 · 深层，第一层）
-- 李雅普诺夫指数：度量混沌的定量指标，>0 表示混沌
-- 偏元 ε 化：指数带留差 ε（混沌的定量指标偏移）

def lyapunov_ε (lyap ε : ℝ) : ℝ := lyap + ε

-- 定理1：退化锚——ε=0 时李雅普诺夫指数退回经典
theorem lyapunov_degenerate (lyap : ℝ) : lyapunov_ε lyap 0 = lyap := by
  unfold lyapunov_ε
  ring

-- 定理2：非平凡——ε≠0 时李雅普诺夫指数偏移
theorem lyapunov_residue {lyap ε : ℝ} (hε : ε ≠ 0) : lyapunov_ε lyap ε ≠ lyap := by
  unfold lyapunov_ε
  intro h_eq
  have : ε = 0 := by linarith
  exact hε this

-- 定理3：留差即偏移量——李雅普诺夫指数的偏移 = ε
theorem lyapunov_offset (lyap ε : ℝ) : lyapunov_ε lyap ε - lyap = ε := by
  unfold lyapunov_ε
  ring

-- 定理4：混沌判据的 ε 偏移——指数>0（混沌）加正 ε 仍 >0（混沌性保持）
theorem lyapunov_chaos_preserved (lyap ε : ℝ) (hlyap : 0 < lyap) (hε : 0 < ε) :
    0 < lyapunov_ε lyap ε := by
  unfold lyapunov_ε
  linarith
