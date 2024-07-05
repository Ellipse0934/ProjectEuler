function solve()
    count = 1 
    for i in 1:9
        j = 1
        for j in 1:100
            digits = ceil(Int, j *log10(i))
            if j == digits
                count += 1
            end
        end
    end
    count 
end

solve()
