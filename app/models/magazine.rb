# == Schema Information
#
# Table name: magazines
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Magazine < ActiveRecord::Base

	has_many :subscriptions
	has_many :customers, through: :subscriptions

end
