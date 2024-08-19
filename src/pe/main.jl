using BenchmarkTools

cmd = ARGS[1]
num = ARGS[2]

if !in(cmd, ("run", "bench"))
    @error "Usage: <run|bench> <problem_number>"
end

include("../../solutions/$(num).jl")

if cmd == "run"
    println(solve())
else
    solve()
    b = @benchmark solve()
    show(stdout, MIME"text/plain"(), b)
end
