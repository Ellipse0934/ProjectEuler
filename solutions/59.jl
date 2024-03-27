

io = open("data/0059_cipher.txt", "r")
str = read(io, String)
v = [parse(Int, x) for x in split(str, ",")]


"Use as map(x, enumerate(v))"
function f(x, key)
    (i, c) = x
    UInt8(c) ⊻ UInt8(key[(i % length(key)) + 1])
end

rg = 'a':'z'
for x in rg, y in rg, z in rg
    key = x * y * z
    u = map(x -> f(x, key), enumerate(v))
    res = sum(u)
    d = Dict{String, Int}()
    ss = mapreduce(i -> Char(i), *, u)
    for s in split(ss, " ")
        if haskey(d, s)
            d[s] += 1
        else
            d[s] = 1
        end
    end

    if get(d, "the",0) > 2 @info key, Int(res), d["the"] end
end
