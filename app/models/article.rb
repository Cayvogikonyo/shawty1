class Article < ApplicationRecord
	has_many :taggings
	has_many :pins, through: :taggings, dependent: :destroy
def pin_list
	pins.join(", ")
end
def pin_list=(pins_string)
	pin_names = pins_string.split(",").collect{|s| s.strip.downcase}.uniq
	new_or_found_pins = pin_names.collect {|name| Pin.find_or_create_by(name: name)}
	self.pins = new_or_found_pins
end
end
