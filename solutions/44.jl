using Base.Sort

p(i) = i * (3 * i - 1) ÷ 2

function solve()
    v = [p(i) for i in 1:1_000_000]
    s = Set(v)
    result = typemax(Int)
    for i in 1:10_000
        for j in (i + 1):(i + 10_000) 
            c = v[j] - v[i]
            d = v[j] + v[i]
            if c in s && d in s
                @info v[j], v[i]
                result = min(result, c)
            end
        end
    end
    result
end
