function solve(L = 1_500_000)
    triangle(m, n) = (
        min(m * m - n * n, 2 * m * n),
        max(m * m - n * n, 2 * m * n),
        m * m + n * n
    )

    d = Dict()
    s = Set{Int}
    m_lim = floor(Int, sqrt(L)) + 1
    for m in 1:m_lim
        for n in 1:(m - 1)
            i = 1
            t = triangle(m, n)
            p = sum(t)
            while i * p <= L
                #@info t .* i
                if haskey(d, p * i)
                    if d[p * i] isa Tuple
                        if d[p * i] != t .* i
                            d[p * i] = false
                        end
                    end
                else
                    d[p * i] = t .* i
                end
                i += 1
            end
        end
    end

    acc = 0
    for (k, v) in d
        if v isa Tuple
            acc += 1
        end
    end
    acc
end
