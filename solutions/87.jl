# Possible optimization:
#  Use binary search to find the bound for j & k
include("common/primes.jl")

function solve()
    p = gen_primes(10_000)
    s = Set{Int}()
    for i in 1:length(p)
       for j in 1:length(p)
           for k in 1:length(p)
               a, b, c = p[i], p[j], p[k]
               term = a^4 + b^3 + c^2 
               if term <= 50_000_000
                   push!(s, term)
               end
           end
       end
    end
    length(s)
end
