class Employeer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  paginates_per 5

  has_many :companies, dependent: :destroy
  has_many :jobs, dependent: :destroy

  mount_uploader :profile_pic, ProfilePicUploader

  def full_name
   	"#{self.first_name} #{self.last_name}"	
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.state}, #{self.country}"
  end

end
