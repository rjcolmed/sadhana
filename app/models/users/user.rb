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
#  image                 :string
#  uid                   :string
#  bio                   :text
#

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true, unless: :omniauth?

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create_by_omniauth(auth_hash)
    User.new.tap do |user|
      user.password = SecureRandom.hex
      user.password_confirmation = user.password
      user.image = auth_hash['info']['image']
      user.uid = auth_hash['uid']
    end
  end

  def self.find_by_omniauth(auth_hash)
    where(email: auth_hash['info']['email']).first
  end

  def omniauth?
    !!uid
  end
end
