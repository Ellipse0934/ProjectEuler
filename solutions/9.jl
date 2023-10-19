using BenchmarkTools
#=
a + b + c = 1000
a^2 + b^2 = c^2

Let's assume a <= b <= c

CASE 1:
    a = 0 =>
    b = c =>
    b ~ 500
CASE 2:
    a = b =>
    2*b^2 = c^2 =>
    sqrt(2)*b = c =>
    2b + sqrt(2)b = 1000 =>
    b ~ 292

Giving us two bounds to work with
=#

function solve()
    for b in 292:500
        for a in 1:b
            c = 1000 - b - a
            if a^2 + b^2 == c^2
                return a * b * c
            end
        end
    end
end

println(solve())
@btime solve()

