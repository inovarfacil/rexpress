# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  slug       :string(255)
#  title      :string(255)
#  name       :string(255)
#  phone      :string(255)
#  email      :string(255)
#  subject    :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
