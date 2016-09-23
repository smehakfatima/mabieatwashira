class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  ROLES = [:admin, :manager, :sales]
  enum role: ROLES

  def role= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end

  def role_enum
    ROLES.each_with_index.to_a
  end
end
