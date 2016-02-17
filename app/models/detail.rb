# == Schema Information
#
# Table name: details
#
#  id          :integer          not null, primary key
#  birthday    :string
#  gender      :string
#  city        :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Detail < ActiveRecord::Base

	# The child
	# This side (the details table) holds the foreign key customer_id
	# so it's effectively the child which belongs_to the parent, customer
	belongs_to :customer

	# If we add methods to Detail we need to remember to add them to the delegation
	# in customer.rb you can do that by adding to the list here.
	ATTR_METHODS = [:birthday, :birthday=, :gender, :gender=, :city, :city=]

end
