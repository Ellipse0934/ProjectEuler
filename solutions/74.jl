function chainlen(x, d = [])
     fs = fsum(x)
     if fs == x
         return 1
     elseif fs in d
         return length(d) + 1
     else
         push!(d, x)
         return chainlen(fs, d)
     end
 end

result = mapreduce(x -> chainlen(x) == 60, +, 1:1_000_000)
@info result
