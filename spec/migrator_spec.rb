require "date"
require "demigration/migrator"

describe Demigration::Migrator do
  let(:migrator) { Demigration::Migrator.new("users") }

  describe "#file" do
    it "should create new file" do
      now = DateTime.new(2021, 6, 23, 11, 1, 5)
      allow(Time).to receive(:now).and_return(now)

      expect(migrator.file).to eql("20210623110105_create_users.rb")
    end
  end

  describe "#classname" do
    it "should convert string to classname" do
      expect(migrator.classname).to eq("CreateUsers")
    end
  end
end
