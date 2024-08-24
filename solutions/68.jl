function gen_perms(v::Vector)
    out = Vector{Int}[]
    if length(v) == 1
        return [v]
    elseif length(v) == 2
        return [
            [v[1], v[2]],
            [v[2], v[1]]
        ]
    else
        for e in 1:length(v)
            u = []
            for x in 1:length(v)
                x != e && push!(u, v[x])
            end
            for vec in gen_perms(u)
                push!(out, [v[e], vec...])
            end
        end
    end
    return out
end

function gen_ring(perm::Vector{Int})
    n = length(perm) ÷ 2 
    lines = T[]
    for i in 1:n
        if i == 1
            v = (perm[1:3]...,)
            push!(lines, v)
        elseif i == n
            v = (
                perm[end],
                perm[3],
                lines[end][2]
            )
            push!(lines, v)
        else
            v = (
                perm[i*2],
                perm[i*2 + 1],
                lines[end][2]
            )
            push!(lines, v)
        end
    end
    lines
end

function check_ring(ring)
    allequal(l) = all(e -> e == l[1], l)
    r = map(x -> sum(x), ring)
    !allequal(r) && return false
    return map_ring(ring)
end

function map_ring(v)
    to_dec(t) = reduce((x, y) -> x*10 + y, t)
    m = map(to_dec, v)
    if m[1] == minimum(m)
        return true 
    end
    false
end

function solve(n = 5)
    out = []
    a = 2*n
    p = gen_perms([1:a...])
    for v in p
        r = gen_ring(v)
        if check_ring(r)
            out = r
        end
    end
    decl(v) = reduce((x, y) -> x * 10 + y, v)
    res = map(l -> decl(l), out)
    mapreduce(string, *, [
        res[1],
        res[end:-1:2]...]
    )
end

