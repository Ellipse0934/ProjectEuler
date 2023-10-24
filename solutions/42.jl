function readwords()
    v = Int[]
    io = open("data/0042_words.txt", "r")

    in_word = false
    val = 0
    while !eof(io)
        c = read(io, Char)
        if c == '"'
            if in_word
                push!(v, val)
                val = 0
            end
            in_word = !in_word
        elseif c in 'A':'Z'
            val += c - 'A' + 1
        end
    end
    v
end

T(x) = x * (x + 1) ÷ 2

function solve()
    word_vals = readwords()
    s = Set{Int}(T(x) for x in 1:100)
    count(
       x -> x in s,
       word_vals
    )
end
