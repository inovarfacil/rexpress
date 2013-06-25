# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  sigla      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
