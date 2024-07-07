# Grid of m * n
# Block 1: 1 * 1: m * n
# Block 2: 1 * 2: m * (n - 1)

function solve(dims = (1000, 1000))
    m, n = dims
    limit = 2_000_000
    solution = limit, dims
    for x in 1: m
        for y in 1:n
            result = solution[1]
            c = count_rectangles((x, y), result, limit)
            if abs(c - limit) < result
                solution = abs(c - limit), (x, y)
            end
        end
    end
    x, y = solution[2]
    x * y
end

function count_rectangles(dims, result, limit)
    x, y = dims
    acc = 0
    for i in 1:x
        for j in 1:y
            acc += (x - i + 1) * (y - j + 1)
            if acc >= limit + result
                return acc
            end
        end
    end
    acc
end
