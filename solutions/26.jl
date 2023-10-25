function div_cycle(divisor)
    dividend = 10
    v = Int[10]

    while true
        q, r = divrem(dividend, divisor)
        dividend = r * 10
        i = findfirst(x -> x == dividend, v)
        if !isnothing(i)
            return length(v) - i + 1
        end
        push!(v, dividend)
    end
end

function solve()
    findmax(div_cycle, 1:1000) 
end
