class Tenant < ApplicationRecord

    has_many :leases
    has_many :apartments, through: :leases

    validates :age, numericality: { greater_than_or_equal_to: 18,  only_integer: true }
    validates :name, presence: true 

end
