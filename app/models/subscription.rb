# == Schema Information
#
# Table name: subscriptions
#
#  id             :integer          not null, primary key
#  subscribe      :datetime
#  expire         :datetime
#  promotion_code :string
#  magazine_id    :integer
#  customer_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# In our example of Customer and Magazine, the connection should be a Subscription.
# This is the join table that holds the foreign keys ( magazine_id and customer_id)
# connecting to one row from magazines and one row from customers.

# Normally if a Customer has_many :magazines the Magazine would belongs_to :customer
# so the Magazine table would have the foreign key customer_id. 
# However, Magazine also has_many :customers, through: :subscriptions
# because it's this table (the join table) that belongs_to :customer 
# so this table holds the customer_id

# Also, the Magazine has_many :customers, through: :subscriptions because this
# join table holds the customer_id

# Our example also has the normal associations, a Customer and a Magazine
# has_many :subscriptions and as you can see, and Subscription belongs_to both
# magazine and customer.

# Why does this happen ? 
# Using "has many through", Rails can hop across the intermediary relationship. 
# We can now call @customer.subscriptions when we want to work with the join,
# and @customer.magazines when we don’t.

# Similarly, @magazine.subscriptions when we want to work with the join 
# and @magazine.customers when we don’t.

class Subscription < ActiveRecord::Base

	belongs_to :magazine
	belongs_to :customer

end
