require_relative '../spec_helper'

describe 'Message model' do
  before :each do
    @time = Time.now
    @message = Message.new body: 'Hello world', scheduled_at: @time, completed: false
  end

  it 'should be valid' do
    expect(@message.valid?).to be_truthy
  end

  it 'expects body to be present' do
    @message.body = ''
    expect(@message.valid?).to be_falsey
  end

  it 'expects scheduled_at to be present' do
    @message.scheduled_at = ''
    expect(@message.valid?).to be_falsey
  end

  it 'expects scheduled_at to be a valid time object' do
    @message.scheduled_at = 'Tomorrow'
    expect(@message.valid?).to be_falsey
    @message.scheduled_at = @time
    expect(@message.scheduled_at.class).to be Time
  end

  it 'expects completed to be a valid boolean' do
    @message.completed = nil
    expect(@message.completed).to be_falsey
  end
end