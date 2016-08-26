require 'rspec'
require 'chronic'
require_relative '../spec_helper'
require_relative '../../workers/parse_sms_worker'

describe 'Parse SMS worker' do
  before :each do
    @message = ['in 5 minutes to wash the dishes', 'at 5pm to cook dinner', 'on Monday to get ready for work'].sample
  end

  it 'finds a valid date within the body' do
    date = ParseSMSWorker.find_date_in_body @message
    expect(date.class).to be Time
  end

  it 'isolates the body from the reminder time' do
    removed = @message[/\b((?!(in|at|on))(.*))(?:to)/, 0]
    trimmed = ParseSMSWorker.isolate_body @message
    expect(trimmed.include?(removed)).to_not eq true
  end
end