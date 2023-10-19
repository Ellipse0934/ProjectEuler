using BenchmarkTools
import Base: haskey, getindex, setindex!

struct Cdict
    vec::Vector{Int}
    d::Dict{Int, Int}
    function Cdict(x)
        v = Vector{Int}(undef, x)
        v .= 0 
        v[1] = 1
        new(v, Dict{Int, Int}())
    end
end

function Base.getindex(c::Cdict, i::Int64)
    if i in 1:length(c.vec)
        if c.vec[i] != 0
            return c.vec[i]
        end
    else
        if haskey(c.d, i)
            return c.d[i]
        end
    end

    if i % 2 == 0
        return c[div(i,2)] + 1
    else
        return c[3*i + 1] + 1
    end
end

function Base.setindex!(c::Cdict, i, v)
    if i in 1:length(c.vec)
        c.vec[i] = v
    else
        c.d[i] = v
    end
end

function solve(x)
   rg = div(x, 2):x
   c = Cdict(1000)
   srch = findmax(x -> c[x], rg)
   srch .+ (0, rg[1] - 1)
end

p = 1_000_000
println(solve(p))
@btime solve(p)
