require "spec_helper"
require "garage/test/migrator"

describe Garage::Test::Migrator do
  include described_class

  after(:all) do
    CreateDoorkeeperTables.migrate(:up)
  end

  it "creates tables for doorkeeper" do
    Doorkeeper::Application.table_exists?.should == true
    Doorkeeper::AccessGrant.table_exists?.should == true
    Doorkeeper::AccessToken.table_exists?.should == true
  end
end
