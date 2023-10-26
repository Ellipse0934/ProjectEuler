function solve()
    result = 1 // 1
    # Let nos be ab & cd
    for ab in 10:98
        for cd in (ab + 1):99
            a, b = divrem(ab, 10)
            c, d = divrem(cd, 10)
            f = ab // cd

            if a == d && b // c == f
                result *= f
            end
            if b == c && a // d == f
                result *= f
            end
        end
    end
    result.den
end

