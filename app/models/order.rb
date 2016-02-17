# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#

class Order < ActiveRecord::Base

	# The child
	# This side (the orders table) holds the foreign key customer_id
	# so it's effectively the child which belongs_to the parent, customer
	belongs_to :customer
	
end
