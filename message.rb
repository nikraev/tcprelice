require 'json'

class Message
  def initialize(message)
    @message  = message    
    self.splitMessage
  end
  
  def splitMessage
    tmp = JSON.parse(@message)
    @header = @message
    @data = @message
  end
  
  def processing
    
  end
    
  def header
    @header
  end
  
  def data
    @data
  end
end