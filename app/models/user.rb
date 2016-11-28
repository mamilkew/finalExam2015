class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :requests


  before_save :assign_role
  def assign_role
    self.role = Role.find_by_name("Regular") if self.role.nil?
  end
  def regular?
    self.role.name == "Regular" if !self.role.blank?
  end
  def staff?
    self.role.name == "Staff" if !self.role.blank?
  end
  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
end
