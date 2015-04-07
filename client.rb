require 'socket'

client = TCPSocket.new('127.0.0.1', 6000)

=begin
message = {
    "header":key => "value", 
            {
              "command":"GET",
              "userid":"nkraev"
             }
     "data":
             {
               "game":"3"
               "move":"Kf3" 
             }  
}
=end

#header = {:command => "GET", :userid => "nkraev"  }
#data = {:game => "GET", :move => "Kf3"  }

string = '{"header":{"command":"GET","userid":"nkraev"},"data":{"game":"3","move":"Kf3"}}'

client.puts string
puts client.gets
client.close
