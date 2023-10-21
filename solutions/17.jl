v_twenty = [
   "one",
   "two",
   "three",
   "four",
   "five",
   "six",
   "seven",
   "eight",
   "nine",
   "ten",
   "eleven",
   "twelve",
   "thirteen",
   "fourteen",
   "fifteen",
   "sixteen",
   "seventeen",
   "eighteen",
   "nineteen",
]

v_tens = [
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
]

function solve()
    res = String[]
    for s in v_twenty
        push!(res, s)
    end
    for t in v_tens
        push!(res, t)
        for digits in v_twenty[1:9]
            push!(res, t * "-" * digits)
        end
    end
    for hundreds in 1:9
        h = v_twenty[hundreds] * " hundred"
        push!(res, h)
        for i in v_twenty
            push!(res, h * " and " * i)
        end
        for i in v_tens
            push!(res, h * " and " * i)
            for j in v_twenty[1:9]
                push!(res, h * " and " * i * "-" * j)
            end
        end
    end
    push!(res, "one thousand")
    f(s) = filter(x -> !in(x, (' ', '-')), s)
    return res .|> f .|> length |> sum 
end 

