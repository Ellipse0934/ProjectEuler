function f(n, r)
     a = reduce(*, 1:n; init = big(1))
     b = reduce(*, 1:r; init = big(1))
     c = reduce(*, 1:(n - r); init = big(1))
     a ÷ b ÷ c
 end

function solve()
    count(x -> if x[1] >= x[2]; f(x[1], x[2]) > 1_000_000 else false end, Iterators.product(1:100, 1:100))
end
