require 'bcrypt'

class User < ActiveRecord::Base

include BCrypt

  has_many :gnaws

  has_many :follower_relationships,
            class_name: 'Relationship',
            foreign_key: 'followee_id'

  has_many :followee_relationships,
            class_name: 'Relationship',
            foreign_key: 'follower_id'

  has_many :followers, through: :follower_relationships
  has_many :followees, through: :followee_relationships

  # validates :user_name, presence: true
  validates :email, presence: true

  def password
    @password ||= Passoword.new(password_digest) if password_digest
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
