const factorials = [
    factorial(i) for i in 1:10
]

function f(v::Vector{Int}, i::Int)
    if i == 0
        return v
    end
    chunk_i = findlast(x -> x <= i, factorials)
    chunk_f, chunk_rem = divrem(i, factorials[chunk_i])
    l = length(v) - chunk_i
    r = l + chunk_f
    v[l], v[r] = v[r], v[l]
    vw = view(v, (l+1):length(v))
    sort!(vw)
    return f(v, chunk_rem)
end

function solve(sz = 9, iter = 1_000_000)
    v = [i for i in 0:sz]
    res = f(v, iter - 1)
    parse(Int, mapreduce(string, *, res)) 
end

println(solve())
