function is_pal(num, base, v = Int[])
    empty!(v)
    if num == 0
        return true
    else
        while num != 0
            push!(v, num % base)
            num ÷= base
        end
        r = div(length(v), 2) 
        for i in 1:r
            opp = length(v) - i + 1
            if v[i] != v[opp]
                return false
            end
        end
        return true
    end
end

function solve()
    limit = 1_000_000
    result = 0
    v = Int[]
    for i in 1:limit
        if is_pal(i, 2, v) && is_pal(i, 10, v)
            result += i
        end
    end
    result
end

println(solve())

