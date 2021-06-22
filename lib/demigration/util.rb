require "active_support/core_ext/string/inflections"

module Demigration
  module Util
    def append_content_to_file(file, line)
      File.write(file, "#{line}\n", mode: "a")
    end

    def ar_version
      if defined? ActiveRecord::Migration
        ActiveRecord::Migration.current_version
      else
        "6.1"
      end
    end

    def schema_file
      "./schema.rb"
    end
  end
end
