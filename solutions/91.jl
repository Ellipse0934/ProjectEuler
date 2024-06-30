function f(a, b, c)
    if a >= b && a >= c
        return a, (b, c)
    elseif b >= c && b >= a
        return b, (c, a)
    else
        return c, (a, b)
    end
end

function ff(p1, p2)
    if p1 == p2 || p1 == (0, 0) || p2 == (0, 0)
        return false
    end
    a = p1 .^ 2
    b = p2 .^ 2
    c = (p2 .- p1) .^ 2
    a, b, c = sum.((a, b, c))
    h, s = f(a, b, c)
    if h == sum(s)
        return true
    else
        return false
    end
end

function solve()
    upto = 50
    i = Iterators.product(0:upto, 0:upto, 0:upto, 0:upto)
    div(count(v -> ff((v[1], v[2]), (v[3], v[4])), i), 2)
end

