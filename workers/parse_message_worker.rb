class ParseMessageWorker
  include Sidekiq::Worker

  def preform(from, body)
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
