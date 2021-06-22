require "demigration/util"

describe Demigration::Util do
  class Hello
    include Demigration::Util
  end

  let(:hello) { Hello.new }

  describe "#append_content_to_file" do
    let(:tmp_file) { "/tmp/demigrate_test" }

    after :each do
      FileUtils.rm tmp_file
    end

    it "should create new file" do
      hello.append_content_to_file(tmp_file, "a")

      expect(File.exist?(tmp_file)).to be(true)
    end

    it "should create new file" do
      content = "test"
      hello.append_content_to_file(tmp_file, content)

      expect(File.read(tmp_file)).to match(Regexp.new(content))
    end
  end

  describe "#ar_version" do
    it "should return default value if ActiveRecord is not defined" do
      expect(hello.ar_version).to eq("6.1")
    end

    it "should return current version if ActiveRecord is defined" do
      module ActiveRecord
        module Migration
          def current_version
            "7.0"
          end
          module_function :current_version
        end
      end

      expect(hello.ar_version).to eq("7.0")
    end
  end
end
