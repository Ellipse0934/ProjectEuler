function solve(s = 5)
    stride = 1
    cursor_val = 2
    result = 1

    while stride < 1001 
        # Go down stride
        cursor_val += stride
        result += cursor_val
        # Increment stride
        stride += 1
        # Go left stride
        cursor_val += stride
        result += cursor_val
        # Go up stride
        cursor_val += stride
        result += cursor_val
        # Go right stride
        cursor_val += stride
        result += cursor_val
        cursor_val += 1
        stride += 1
    end
    result
end
