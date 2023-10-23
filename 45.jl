T(x) = x * (x + 1) ÷ 2
P(x) = x * (3 * x - 1) ÷ 2
H(x) = x * (2 * x - 1)


function solve()
    t_i, p_i, h_i = 1, 1, 1
    t_v, p_v, h_v = 1, 1, 1

    step = 1
    while step < 3*10_000_000
        smallest = min(t_v, p_v, h_v)
        if t_v == smallest
            t_i += 1
            t_v = T(t_i)
        end
        if p_v == smallest
            p_i += 1
            p_v = P(p_i)
        end
        if h_v == smallest
            h_i += 1
            h_v = H(h_i)
        end
        if t_v == p_v && p_v == h_v
            if t_v > 40755
                return t_v
            end
        end
        step += 1
    end
end

"Silly solution"
function solve2()
    range = 1:100_000
    pentagonals = Set{Int}(P(x) for x in range)
    hexagonals = Set{Int}(H(x) for x in range)
    for i in range
        val = T(i)
        if val in pentagonals && val in hexagonals
             if val > 40755
                return val
             end
        end
    end
    nothing
end

println(solve())

