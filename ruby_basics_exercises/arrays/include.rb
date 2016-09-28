arr1 = [1, 3, 5, 7, 9, 11]
num1 = 4

def included(num, arr)
    return arr.include?(num)
end

p included(num1, arr1)