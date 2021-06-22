require "active_support/core_ext/string/inflections"
require "active_support/core_ext/date_time/calculations"

module Demigration
  class Migrator
    attr_accessor :table
    def initialize(table)
      @table = table
    end

    def file
      "#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_#{@table}.rb"
    end

    def classname
      "Create#{ActiveSupport::Inflector.classify(@table.to_s).pluralize}"
    end
  end
end
