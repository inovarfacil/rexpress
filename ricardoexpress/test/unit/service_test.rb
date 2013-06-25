# == Schema Information
#
# Table name: services
#
#  id             :integer          not null, primary key
#  slug           :string(255)
#  name           :string(255)
#  title          :string(255)
#  description    :text
#  servicetype_id :integer
#  circuit_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  circuit_name   :string(255)
#  resumo         :text
#  imagem         :string(255)
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
