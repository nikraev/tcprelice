class Message
  def initialize(message)
    @message  = message    
    self.splitMessage
  end
  
  def splitMessage
    @header = @message
    @data = @message
  end
  
  def header
    @header
  end
  
  def data
    @data
  end
end