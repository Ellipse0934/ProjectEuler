function solve()
    maximum(f, 1:99999)
end

function f(x)
    v = [false for i in 1:9]
    result = "0"
    for i in 1:9
        for c in string(x * i)
            n = parse(Int, c)
            if !(n in 1:9) || v[n]
                return -1
            else
                result *= c
                v[n] = true
            end
        end
        if all(v)
            return parse(Int, result)
        end
    end
end

@info solve()
