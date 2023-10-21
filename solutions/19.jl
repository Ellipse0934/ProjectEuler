function leap(year)
    if year % 4 == 0
        if year % 100 != 0
            return true
        elseif year % 400 == 0
            return true
        else
            return false
        end
    else
        return false
    end
end

"Return the first day of the next month"
function f(month, year, day)
    days = if month == 2
        if leap(year)
            29
        else
            28
        end
    elseif month in (4, 6, 9, 11)
        30
    else
        31
    end
    return (day + days + 1) % 7
end

function solve()
    result = 0
    # Let 0 => monday
    # 1 => 7
    day = 0
    for year in 1900:2000
        for month in 1:12
            if day == 6 && year != 1900
                result += 1
            end
            day = f(month, year, day)
        end
    end
    result
end

println(solve())
