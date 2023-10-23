function solve()
    lim = 1_000_000 
    result = 0
    for i in 10:lim
        fs = mapreduce(x -> factorial(x - '0'),
            +,
            string(i)
        )
        if fs == i
            @info i
            result += i
        end
    end
    result
end

println(solve())
