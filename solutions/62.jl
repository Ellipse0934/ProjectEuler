function solve()
    d = Dict{String, Vector{Int}}()
    for i in 1:100_000
        str = reduce(*, sort([c for c in string(i^3)]))
        if haskey(d, str)
            push!(d[str], i)
            if length(d[str]) == 5
                return d[str][1]^3
            end
        else
            d[str] = [i]
        end
    end
end

solve()
