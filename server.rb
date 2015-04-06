require 'socket'
require 'logger'
require_relative 'message'

$LOG = Logger.new('/tmp/server.log')
$LOG.level = Logger::DEBUG 

class Server
  def initialize( host, port)
    @host = host
    @port = port
    $LOG.debug("Initialization host = #{@host} and port = #{@port}")
  end
  
  def start
    
    #Process.daemon
    begin 
      server = TCPServer.new(@host, @port)
      $LOG.debug("Start UPDServer server")
        
      loop do
        Thread.start(server.accept) do |client|
          $LOG.debug("Client is coming")
          message = Message.new(client.gets)
          $LOG.debug("Create new class Message, where message.data = #{message.data}")
          if (message.data.to_s == "GETS")
            $LOG.debug("if message.data == #{message.data}")
            client.puts("PUTS")
            $LOG.debug("Data Sent to client")
            client.close
            $LOG.debug("Client close process")
          else
            $LOG.debug("GETS != #{message.data}")
            client.close 
            break
          end
        end
        server.close
      end
      
            
    rescue Exception => e
     $LOG.error(e.message)
     $LOG.debug(e.backtrace.inspect)
    end
  end
  
end

server = Server.new('127.0.0.1', '6000')
server.start
