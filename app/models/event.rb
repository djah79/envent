class Event < ApplicationRecord
	validates :start_date, presence: true, availability: true
	validate :start_date_not_past
	has_many :attendances
	has_many :users, through: :attendances
	def start_date_not_past
		return if start_date.blank?
		if start_date < Time.now
			errors.add(:start_date, "Must be in the futur")
		end
	end
end
