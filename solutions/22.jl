function readnames()
    io = open("data/0022_names.txt", "r")
    v = String[]
    while !eof(io)
        c = read(io, Char)
        if c == '"'
            s = ""
            while true
                c = read(io, Char)
                if c == '"'
                    push!(v, s)
                    break
                else
                    s *= c
                end
            end
        end
    end
    v
end

function solve()
    v = readnames()
    sort!(v)
    f(s) = mapreduce(
        x -> x - 'A' + 1,
        +,
        s
    )
    result = 0
    for (i, val) in enumerate(v)
        result += i * f(val)
    end
    result
end

println(solve())
