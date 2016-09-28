def count_down(num)
    puts num
    if num < 1
        return 0
    end
    count_down(num-1)
end

count_down(20)