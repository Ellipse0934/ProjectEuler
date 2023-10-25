# Sue me
function digitsum(x, y)
    str = string(big(x)^y)
    mapreduce(x -> x - '0', +, str)
end

function solve()
    val, best = (-1, -1), -1
    for x in 1:100
        for y in 1:100
            ds = digitsum(x, y)
            if ds > best
                val, best = (x, y), ds
            end
        end
    end
    best 
end
