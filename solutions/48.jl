# Dirty code, needs cleanup
function numvec(i::Int, digits = 10)
    v = UInt8[0 for i in 1:10]
    dig = 1
    while i != 0 && dig <= 10
        v[dig] = i % 10
        i ÷= 10
        dig += 1
    end
    v
end

"u = u * v"
function mult!(u, v)
    t = numvec(0)
    for digit in 1:10
        x = u .* v[digit]
        t[digit:10] .+= x[1:(10 - digit + 1)]
        for digit in 1:10
            if t[digit] >= 10
                x, y = divrem(t[digit], 10)
                t[digit] = y
                if digit != 10
                    t[digit+1] += x
                end
            end
        end
    end
    u .= t
end

function to_num(v)
    u = reverse(v)
    result = 0
    for i in 1:length(u)
        result *= 10
        result += u[i]
    end
    result
end 

function solve()
    result = numvec(0)
    for i in 1:1000
        u = numvec(i)
        v = numvec(i)
        for j in 2:i
            try
                mult!(u, v)
            catch ex
                @info i, j
                error("x")
            end
        end

        result .+= u
        for digit in 1:10
            if result[digit] >= 10
                x, y = divrem(result[digit], 10)
                result[digit] = y
                if digit != 10
                    result[digit+1] += x
                end
            end
        end
    end
    to_num(result)
end

