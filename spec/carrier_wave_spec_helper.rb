require 'carrierwave'
require 'carrierwave/orm/activerecord'
Dir["./app/uploaders/*.rb"].each {|file| require file }
