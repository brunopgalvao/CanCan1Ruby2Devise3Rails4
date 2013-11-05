class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  validates_uniqueness_of :email, :allow_blank => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
