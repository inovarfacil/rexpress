# == Schema Information
#
# Table name: managements
#
#  id          :integer          not null, primary key
#  site_name   :string(255)
#  tagline     :string(255)
#  description :text
#  keywords    :string(255)
#  icon        :string(255)
#  logo        :string(255)
#  facebook    :string(255)
#  twitter     :string(255)
#  linkedin    :string(255)
#  youtube     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ManagementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
