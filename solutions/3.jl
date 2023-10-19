using BenchmarkTools
# There cannot be any prime factor above sqrt(N)
#
# The input is ~ 6e11 therefore brute is manageable
# Can use a precomputer sieve

INPUT = 600_851_475_143

function solve(in = INPUT)
    in_copy = in
    max_possible = round(Int, sqrt(in) + 1)
    res = nothing
    while in % 2 == 0
        in = div(in, 2)
        res = 2
    end

    for i = 3:2:max_possible
        if in == 1
            return res
        end
        while in % i == 0
            res = i
            in = div(in, i)
        end
    end
    if in_copy == in
        res = in
    end
    res
end



println(solve())
@btime solve()

