class Specialty < ApplicationRecord
  has_many :inter_specs
  has_many :doctors, through: :inter_specs
end
