using Plots
using LaTeXStrings
pgfplots()

c = 1
a₀ = 1
ω = 1

x(τ) = c*(a₀^2)/4 *(τ - 1/2* ω*sin(2ω*τ))
y(τ) = c*a₀/ω *(1-cos(ω*τ))

p1 = plot(x, y, 0, 15,
  xlabel=L"x", ylabel=L"y",
  xticks=nothing, yticks=nothing,
  legend=:none,
  framestyle=:box,
  tex_output_standalone=true
)

v_drift = c*a₀^2/4

p2 = plot(τ->x(τ)-v_drift*τ, y, 1, 10,
  xlabel=L"x", ylabel=L"y",
  xticks=nothing, yticks=nothing,
  legend=:none,
  framestyle=:box,
  tex_output_standalone=true
)

p = plot(p1, p2,
  layout=grid(1,2,widths=[0.7,0.3]),
  framestyle=:box,
  tex_output_standalone=true
)

savefig(p, "figures/electron-in-plane-wave.tex")
