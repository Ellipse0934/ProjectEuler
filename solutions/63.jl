#=
# TODO: Don't use bigint for this problem
=#

function digits(n)
    count = 1
    while n >= 10
        n ÷= 10
        count += 1
    end
    count
end

function f()
    count = 0
    for i in 1:10
        j = 1
        for j in 1:100
            n = big(i) ^ j
            if j == digits(n) 
                count += 1
            end
        end
    end
    count 
end
