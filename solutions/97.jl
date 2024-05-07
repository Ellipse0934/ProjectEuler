function solve()
    n = 28433
    x = 1
    for i in 1:7830457
        x *= 2
        if x >= 10_000_000_000
            x %= 10_000_000_000
        end
    end
    (n * x + 1) % 10_000_000_000
end

@info solve()
