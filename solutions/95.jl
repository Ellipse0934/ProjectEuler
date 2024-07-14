# TODO: Very slow, must improve.

function divisor_sum(x)
    mapreduce(+, 1:(x - 1), init = 0) do d
        if x % d == 0
            return d
        else
            return 0
        end
    end
end

function solve()
    # List of processed numbers
    s = Set{Int}()

    for n in 3:1_000_000
        is_chain, chain = make_chain(n, s)
        if is_chain != -1
            @info is_chain, chain
        end
    end
end

function make_chain(n, s)
    chain = Int[n]
    if n in s
        return -1, -1
    end
    m = divisor_sum(n)
    while true
        if m == 1 || m > 1_000_000
            return -1, -1
        end
        idx = findfirst(x -> x == m, chain)
        if !isnothing(idx)
            push!(s, m)
            return chain[idx], length(chain) - idx + 1
        else
            if m in s
                return -1, -1
            else
                push!(s, m)
                push!(chain, m)
                m = divisor_sum(m)
            end
        end
    end
end
