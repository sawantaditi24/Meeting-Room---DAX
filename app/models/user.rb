class User < ApplicationRecord

  has_many  :reservations
  has_many :clients  
  has_many :bookings 
  has_many :locations


  enum role: [:user, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def upcoming_bookings
    bookings.order(appointment_time: :desc).select { |a| a.appointment_time > (DateTime.now) }
  end
 
  
  
end
