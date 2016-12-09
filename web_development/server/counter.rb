require 'socket'

def parse_request(request_line)
  http_method, params, http = request_line.split(" ")
  params.slice!(/\/\?/)
  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_line = client.gets

  next unless request_line
  params = parse_request request_line
  number = params["number"].to_i

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts params
  client.puts request_line
  client.puts "</pre>"
  client.puts "<h1>Counter!</h1>"
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  client.puts "</body>"
  client.puts "</html>"
  client.close
end