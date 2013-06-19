# == Schema Information
#
# Table name: slides
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  background :string(255)
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
