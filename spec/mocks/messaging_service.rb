class MessagingService
  Message = Struct.new :from, :to, :body

  cattr_accessor :messages
  self.messages = []

  def initialize(_sid, _token)
    # Mock
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages.push from: from, to: to, body: body
  end
end