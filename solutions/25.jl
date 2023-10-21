# Trivial with bigint but since this is the expectation
# I decided to be faithful
function solve()
    x = Vector{UInt8}(undef, 1000)
    y = Vector{UInt8}(undef, 1000)
    x .= 0
    y .= 0
    x[1] = 1
    y[1] = 1
    u = x
    v = y
    flag = true
    index = 3
    remainder = 0
    while true
        for i in 1:999
            remainder, v[i] = divrem(u[i] + v[i] + remainder, 10)
        end
        if remainder != 0
            return index
        end
        index += 1
        u, v = v, u
    end
end 

println(solve())

