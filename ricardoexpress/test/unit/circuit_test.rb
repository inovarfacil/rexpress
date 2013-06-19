# == Schema Information
#
# Table name: circuits
#
#  id               :integer          not null, primary key
#  origin_city      :string(255)
#  destination_city :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ce_id            :integer
#

require 'test_helper'

class CircuitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
