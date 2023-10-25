function solve()
    result = 1
    digit = 1
    interest = [10^x for x in 0:6]
    for i in 1:1_000_000
        s = string(i)
        for j in 1:length(s)
            if digit in interest
                result *= s[j] - '0'
            end
            digit += 1
        end
    end
    result
end
