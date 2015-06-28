class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter

  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
end
