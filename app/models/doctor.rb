class Doctor < ApplicationRecord
  belongs_to :city
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :inter_specs
  has_many :specialties, through: :inter_specs, source: :name
end
