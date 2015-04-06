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
      $LOG.debug("Start server")
        
      loop do
        Thread.start(server.accept) do |client|
          stream = client.gets
          message = Message.new(stream)
          send = message.processing
          $LOG.debug("Create new class Message, where message.data = #{message.data}")
          client.puts message.data
        end
      end
      
      server.close
            
    rescue Exception => e
     $LOG.error(e.message)
     $LOG.debug(e.backtrace.inspect)
    end
  end
  
end

server = Server.new('127.0.0.1', '6000')
server.start
