function f!(d, s)
    i = 1
    while i * 3  <= d
        i += 1
    end
    while i * 2 < d
        push!(s, i // d)
        i += 1
    end
end

function solve(x = 12000)
    s = Set{Rational{Int}}()
    for d in 1:x
        f!(d, s)
    end
    length(s)
end


