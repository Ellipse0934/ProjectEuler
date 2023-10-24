#=
# Can be optimised by adding the list of primes
# Maybe something is possible by storing the prime factorizations in a different format.
=#
function factorization(a, b)
    if a in 0:1
        return ""
    end

    result = ""

    cnt = 0
    while a % 2 == 0
        cnt += 1
        a ÷= 2
    end
    if cnt != 0
        result *= "2-$(b * cnt)"
    end

    num = 3
    while a != 1
        cnt = 0
        while a % num == 0
            cnt += 1
            a ÷= num
        end
        if cnt != 0
            result *= ",$(num)-$(b * cnt)"
        end
        num += 2
    end
    result
end

function solve()
    s = Set{String}()
    for a in 2:100
        for b in 2:100
            # Factorize a
            push!(s, factorization(a, b))
        end
    end
    length(s) 
end
