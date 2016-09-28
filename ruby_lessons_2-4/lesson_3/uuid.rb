require 'securerandom'
uuid = SecureRandom.hex(8) + "-" + SecureRandom.hex(4) + 
       "-" + SecureRandom.hex(4) + "-" + SecureRandom.hex(4) + 
       "-" + SecureRandom.hex(12)

p uuid
