# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  username              :string
#  email                 :string
#  password_digest       :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  type                  :string
#  password_confirmation :string
#

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
