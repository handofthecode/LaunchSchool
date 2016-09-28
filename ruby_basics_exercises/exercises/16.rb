a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
b = []
a.map do |words|
    words.split.map do |word|
        b.push(word)
    end
end
p b
             