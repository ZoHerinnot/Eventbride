class Event < ApplicationRecord
	
	   #validation de start_date
	validates :start_date, presence: true, if: :validate_start_date

     #validation de duration
	validates :duration, presence: true, if: :validate_duration

    #validation de title   
  validates :title, presence: true, length: { in: 5..140}

    #validation de description 
  validates :description, presence: true, length: {in: 20..1000}

    #validation de price 
  validates :price, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..1000}

    #validation de location
  validates :location, presence: true

  has_many :users ,through: :attendance 
  has_many :attendances

  def validate_start_date
  	errors.date(:start_date, "can't be in the past") if
  	!start_date.blank? and start_date < Date.today
  end

  def validate_duration
     duration%5 == 0  	
  end

end
