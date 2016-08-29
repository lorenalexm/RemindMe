require 'rspec'
require 'chronic'
require_relative '../spec_helper'
require_relative '../../workers/parse_message_worker'

describe 'ParseMessage worker' do
  before :each do
    @message = ['in 5 minutes to wash the dishes', 'at 5pm to cook dinner', 'on Monday to get ready for work'].sample
    @timeless_message = ['take the dogs for a walk', 'to go to the store', 'to actually go to the gym'].sample
  end

  it 'finds a valid date within the body' do
    date = ParseMessageWorker.find_date_in_body @message
    expect(date.class).to be Time
  end

  it 'sets a default time if none is specified' do
    date = ParseMessageWorker.find_date_in_body @timeless_message
    now = Time.now
    expect(date.hour).to eq now.hour + 3
  end

  it 'isolates the body from the reminder time' do
    removed = @message[/\b((?!(in|at|on))(.*))(?:to)/, 0]
    trimmed = ParseMessageWorker.isolate_body @message
    expect(trimmed.include?(removed)).to_not eq true
  end

  it 'returns the same body if no time is given' do
    parsed = ParseMessageWorker.isolate_body @timeless_message
    expect(parsed).to eq @timeless_message
  end

end