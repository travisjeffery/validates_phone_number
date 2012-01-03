unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

ENV['RAILS_ENV'] = 'minitest'
begin
  require 'minitest/autorun'
rescue LoadError
  require 'rubygems'
  require 'minitest/unit'
  MiniTest::Unit.autorun
end

require 'active_model'
require 'active_model/validations'
require 'active_record'
require 'action_view'

require_relative '../lib/validates_phone_number'

ActiveRecord::Base.establish_connection({:adapter => 'sqlite3', :database => ':memory:'})
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  create_table :people, :force => true do |t|
    t.string :phone_number, :allow_nil => true
  end
end

class Person < ActiveRecord::Base
end
