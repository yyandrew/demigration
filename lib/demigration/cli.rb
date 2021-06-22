require "pry"
require "thor"
require_relative "base"

module Demigration
  class CLI < Thor
    include Util

    desc "export! [TABLE]", "Export special table"
    method_options table: :string
    def export!
      table = options[:table]
      table_found = false

      migrator = Migrator.new(table)
      filename = migrator.file

      unless File.exist?(schema_file)
        puts "Please put the schema.rb at current folder."
        return
      end

      File.foreach(schema_file) do |line|
        line = line.chomp
        if line.match(Regexp.new("create_table \"#{table}\""))
          File.write(filename, "class #{migrator.classname} < ActiveRecord::Migration[#{ar_version}]\n")
          table_found = true
        end

        if table_found
          append_content_to_file(filename, line)
          break if line.strip === "end"
        end
      end

      append_content_to_file(filename, "end") if File.exist?(filename)
    end
  end
end
