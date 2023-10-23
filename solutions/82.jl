function readint(io)
    while !eof(io)
        num = nothing
        c = read(io, Char)
        while !in(c, '0':'9')
            if eof(io)
                error("Cannot read any int")
            end
            c = read(io, Char)
        end
        num = c - '0'
        while !eof(io)
            c = read(io, Char)
            if !in(c, '0':'9')
                return num
            else
                num = num * 10 + (c - '0')
            end
        end
        return num
    end
end

function readmat()
    io = open("data/0082_matrix.txt", "r")
    mat = Matrix{Int}(undef, (80, 80))
    for i in 1:80
        for j in 1:80
            mat[i, j] = readint(io) 
        end
    end
    mat
end

function solve()
    m = readmat() 
    for col in 2:80
        best = m[:, col - 1] + m[:, col]
        for _ in 1:80
            for i in 1:80
                if i == 1
                    best[i] = min(best[i], m[i, col] + best[i + 1])
                elseif i == 80
                    best[i] = min(best[i], m[i, col] + best[i - 1])
                else
                    best[i] = min(
                        best[i],
                        m[i, col] + best[i + 1],
                        m[i, col] + best[i - 1]
                    )
                end
            end
        end
        m[:, col] .= best
    end
    m[:, 80]
end

println(solve())
