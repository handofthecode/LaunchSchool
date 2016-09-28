arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
word = "lab"

def lab_check(array, check)
    array.each { |word|
    if word.downcase.include?(check)
        puts word 
    end }
end
lab_check(arr, word)