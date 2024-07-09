function solve()
    acc = 0
    for s in 2:1_000_000_000
        if (3*s - 1) >= 1_000_000_000
            return acc
        end
        num = (3*s + 1) * (s - 1)
        rt = floor(Int, sqrt(num))
        if rt^2 == num
            if (rt * (s + 1)) % 4 == 0
                acc += (3 * s + 1)
            end
        end
        
        num = (3*s - 1) * (s + 1)
        rt = floor(Int, sqrt(num))
        if rt^2 == num
            if (rt * (s - 1)) % 4 == 0
                acc += (3 * s - 1)
            end
        end
    end
end

solve()

