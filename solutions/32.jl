function is_pan(a, b)
    pan = Char[c for c in '1':'9']
    str = sort(Char[c for c in string(a, b, a * b)])
    str == pan
end

function solve()
    s = Set{Int}()
    for i in 1:999
        j = i + 1
        while i * j <= 9999
            if is_pan(i, j)
                push!(s, i * j)
            end
            j += 1
        end
    end
    sum(s) 
end

println(solve())
