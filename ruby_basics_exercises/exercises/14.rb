contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
keys = [:email, :address, :phone]
num = 0

contacts.each do |name, hash|
    keys.each do |key|
        hash[key] = contact_data[num].shift
    end
    num += 1
end

p contacts

            
