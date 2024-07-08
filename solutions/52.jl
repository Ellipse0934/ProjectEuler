function solve()
    function ds(n)
        v = zeros(Int, 10)
        for c in string(n)
            v[c - '0' + 1] += 1
        end
        v
    end
    for i in 1:1_000_000
        r = ds(i)
        flag = true
        for m in (2, 3, 4, 5, 6)
            flag = ds(m * i) == r
            if !flag
                break
            end
        end
        if flag
            @info i
            return i
        end
    end
end
