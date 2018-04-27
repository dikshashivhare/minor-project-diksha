class JobSeeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :job_seeker_jobs
  has_many :jobs, through: :job_seeker_jobs
  
  mount_uploader :profile_pic, ProfilePicUploader
  mount_uploader :resume, DocxUploader

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
