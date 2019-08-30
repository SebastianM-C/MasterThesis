using Plots
using LaTeXStrings
pgfplots()

# function save(p, fn)
#     savefig(p, fn)
#     open(fn, "r+") do io
#         contents = read(io)
#         seekstart(io)
#         preamble = "\\documentclass[tikz]{standalone}\n"*"\\usepackage{standalone}\n"*
#         "\\usepackage{tikz,pgfplots}\n"*"\\pgfplotsset{compat=newest}\n"*
#         "\\pgfplotsset{every axis legend/.append style={cells={anchor=west}}}\n"*
#         "\\usetikzlibrary{arrows}\n"*"\\tikzset{>=stealth'}\n"*"\\begin{document}\n"
#         write(io, preamble)
#         write(io, contents)
#         seekend(io)
#         write(io, "\\end{document}")
#     end
# end

P_A(n; p=0.9965) = 1/(1-p + p/n)
P_G(n; p=0.9965) = 1 - p + n*p

ps = [0.5, 0.75, 0.9, 0.95]

pa = plot([n->P_A(n, p=p) for p in ps], 1, 65535,
    label=[latexstring("p=$p") for p in ps],
    xaxis=:log2,
    xlabel="Number of Processors", ylabel="Speedup",
    legend=:topleft,
    minorgrid=true, minorgridalpha=0.1,
    framestyle=:box,
    tex_output_standalone=true
)

savefig(pa, "figures/theoretical-scaling-Amdahl.tex")

pg = plot([n->P_G(n, p=p) for p in ps], 1, 65535,
    label=[latexstring("p=$p") for p in ps],
    xaxis=:log2,
    xlabel="Number of Processors", ylabel="Speedup",
    legend=:topleft,
    minorgrid=true, minorgridalpha=0.1,
    framestyle=:box,
    tex_output_standalone=true
)

savefig(pg, "figures/theoretical-scaling-Gustafson.tex")

p1 = plot([P_A, P_G, identity], 1, 20,
    label=["strong scaling", "weak scaling", "perfect"],
    # xaxis=:log10, yaxis=:log10,
    xlabel="Number of Processors", ylabel="Speedup",
    legend=:topleft,
    minorgrid=true, minorgridalpha=0.1,
    framestyle=:box,
    tex_output_standalone=true
)

p2 = plot([P_A, P_G], 1, 65536,
    label=["strong scaling", "weak scaling"],
    xaxis=:log10, yaxis=:log10,
    xlabel="Number of Processors", ylabel="Speedup",
    legend=:topleft,
    minorgrid=true, minorgridalpha=0.1,
    framestyle=:box,
    tex_output_standalone=true
)

p = plot(p1, p2, tex_output_standalone=true)

savefig(p, "figures/theoretical-scaling-all.tex")
