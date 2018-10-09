require 'statement'

describe ".DisplayStatement" do

  before(:each) do
    @statement = Statement.new
  end

  it "can be created" do
    expect(@statement).to be_instance_of(Statement)
  end

end
