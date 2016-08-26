class ParseSMSWorker
  include Sidekiq::Worker

  def preform(from, body)

  end

  def self.find_date_in_body(body)
    parsed = Chronic.parse body[/\b((?=(in|at|on))(.*))(?:to)/, 1], :context => :future
    parsed = Chronic.parse body[/\b((?!(in|at|on))(.*))(?:to)/, 1], :context => :future if parsed == nil
    parsed
  end

  def self.isolate_body(body)
    body[/(?=to)(.*)/, 1]
  end
end
