require 'socket'

client = TCPSocket.new('127.0.0.1', 6000)
client.puts 'GETS'
puts client.gets
client.close
