primes = (
    2,
    3,
    5,
    7,
    11,
    13,
    17
)

function qualify(n)
    if n[1] == 0 || length(n) != 10
        return false
    end
    for i in 1:length(primes)
        num = mapreduce(x -> n[i + x], (x, y) -> x * 10 + y, 1:3)
        if num % primes[i] != 0
            return false
        end
    end
    true
end

function solve(s = [0:9...], n = Int[], result = Ref{Int}(0))
    if(length(s) == 0)
        num = reduce((x, y) -> x * 10 + y, n)
        n_vec = map(c -> c - '0', [string(num)...])
        if qualify(n_vec)
            result[] += num
        end
        return
    else
        for x in s
            push!(n, x)
            s_copy = Int[]
            for k in s
                if k != x
                    push!(s_copy, k)
                end
            end
            solve(s_copy, n, result)
            pop!(n)
        end
        if(length(s) == 10)
            @info result[]
        end
    end
end
