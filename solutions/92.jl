function dig_sum(i)
    result = 0
    while i != 0
        result += (i % 10) * (i % 10)
        i ÷= 10
    end
    result
end

function solve()
    sz = 9 * 9^2
    # 0x00 => ends on 1
    # 0x01 => true, ends on 89
    # 0x02 => unknown
    cache = Vector{UInt8}(undef, sz)
    cache .= 0x02
    cache[89] = 0x01 
    cache[1] = 0x00

    digits = Int[]
    s = Set{Int}()
    # Build cache
    for i in 1:sz
        num = i
        while true
            if cache[num] == 0x02
                push!(s, num)
                num = dig_sum(num)
            else
                for e in s
                    cache[e] = cache[num] 
                end
                empty!(s)
                break
            end
        end
    end
    count(
        x -> cache[dig_sum(x)] == 0x01,
        1:10_000_000
    )
end

println(solve())
