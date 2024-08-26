include("./common/primes.jl")

function scan(v::Vector{T}) where T
    r = Vector{T}(undef, length(v))
    r[1] = v[1]
    for i in 2:length(v)
        r[i] = r[i - 1] + v[i]
    end
    r
end

function solve(n = 1_000_000)
    p = gen_primes(n)
    acc = scan(p)
    s = Set(p)
    
    l = 1
    found = true
    res = 0, 0
    for i in 1:length(acc)
        for j in (i + 1):min((i + 2000), length(acc))
            d = acc[j] - acc[i]
            if d in s
                if j - i > res[1]
                    res = j - i, d
                end
            end
        end
    end
    res
end

