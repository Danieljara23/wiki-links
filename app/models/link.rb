# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  link        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Link < ApplicationRecord
	has_many :comments, :as => :commentable
	validates :title, :description, :link, presence: true
end
