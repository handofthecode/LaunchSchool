array = Array(50..75)
def array_plus_two(arr)
    new_arr = arr.map { |num| num + 2 }
    return new_arr
end

p array
p array_plus_two(array)
    