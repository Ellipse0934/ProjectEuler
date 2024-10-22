function f(n)
    if n == 1
        return big(1) + 1 // 2
    else
        return big(1) + 1 // g(n)
    end
end

function g(n)
    if n == 2
        return big(2) + 1 // 2
    else
        return big(2) + 1 // g(n - 1)
    end
end

digits(x) = x > 0 ? ceil(Int, log10(x)) : 0

solve() = count((x) -> digits(x.num) > digits(x.den), f.(1:1000))
