function gen_abundants()
    v = Int[]
    limgrave = 28123
    for i in 2:limgrave
        s = 0
        for j in 1:div(i, 2)
            if i % j == 0
                s += j
            end
        end
        if s > i
            push!(v, i)
        end
    end
    v
end

function solve()
    limgrave = 28123
    result = 0
    v = gen_abundants()
    s = Set(v)
    for i in 1:limgrave
        j = 1
        can_rep = false
        while j <= length(v) && v[j] <= i
            if i - v[j] in s
                can_rep = true
                break
            end
            j += 1
        end
        if !can_rep
            result += i
        end
    end
    result
end
