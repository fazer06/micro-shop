# == Schema Information
#
# Table name: customers
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  username      :string
#  password      :string
#  email_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Customer < ActiveRecord::Base

	# The parent 
	# This side (the customers table) is the parent, and it has one child object
	has_one :detail,  dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :subscriptions
	has_many :magazines, through: :subscriptions

	# From the outside we shouldn’t know the Detail object exists at all. 
	# To do that we use Rails’ delegate method:
	# Ruby’s splat (*)operator breaks apart an array into a list of parameters
	delegate *Detail::ATTR_METHODS, to: :detail

	# Create an attached Detail object whenever a Customer object is initialized
	# we do that with after_initialize which is an Active Record callback
	after_initialize do
		self.build_detail if detail.nil?
	end

	# Now when we call Customer.new it will automatically build a Detail and 
	# associate them in memory. Once the Customer is saved it will get an 
	# ID from the database and that ID will be stored in the customer_id field 
	# of the Detail. We only want to build a Detail object if we don’t already 
	# have one, so we add the if detail.nil? condition to avoid replacing an 
	# existing Detail object.

end
