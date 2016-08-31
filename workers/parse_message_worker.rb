class ParseMessageWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'parsing'

  def perform(user_id, body)
    time = self.class.find_date_in_body body
    body = self.class.isolate_body body
    SendMessageWorker.perform_at(time)
  end

  def self.find_date_in_body(body)
    parsed = Chronic.parse body[/\b((?=(in|at|on))(.*))(?:to)/, 1], :context => :future
    parsed = Chronic.parse body[/\b((?!(in|at|on))(.*))(?:to)/, 1], :context => :future if parsed.nil?
    parsed = Time.now + 3*60*60 if parsed.nil?
    parsed
  end

  def self.isolate_body(body)
    parsed = body[/(?=to)(.*)/, 1]
    parsed = body if parsed.nil?
    parsed
  end
end
