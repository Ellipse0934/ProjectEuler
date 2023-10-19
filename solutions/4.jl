using BenchmarkTools

function is_pal(s)
    res = true
    for i = 1:(div(length(s), 2))
        res = res && s[i] == s[length(s) - i + 1]
    end
    res
end

function solve()
    res = -1
    r = 100:999
    for i in r
        for j in r
            num = i * j
            # String conversion is unnecessary
            # unless convenience is preferred.
            if is_pal(string(num))
                res = max(res, num)
            end
        end
    end
    res
end

println(solve())
@btime solve()

