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

function solve()
    io = open("data/0081_matrix.txt", "r")
    mat = Matrix{Int}(undef, (80, 80))
    for i in 1:80
        for j in 1:80
            mat[i, j] = readint(io) 
        end
    end

    for j in 2:80
        mat[1, j] += mat[1, j - 1]
        mat[j, 1] += mat[j - 1, 1]
    end

    for i in 2:80
        for j in 2:80
            mat[i, j] += min(mat[i - 1, j], mat[i, j - 1]) 
        end
    end
    return mat[80, 80]
end

println(solve())
