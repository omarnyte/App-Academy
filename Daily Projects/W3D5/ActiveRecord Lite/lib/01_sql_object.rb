require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      cols = DBConnection.execute2(<<-SQL).first
        SELECT
          *
        FROM
          #{self.table_name}
        LIMIT
          0
      SQL
      cols.map!(&:to_sym)
      @columns = cols
    else
      @columns
    end
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        @attributes[column]
      end

      define_method("#{column}=") do |value|
        @attributes = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= { }
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
