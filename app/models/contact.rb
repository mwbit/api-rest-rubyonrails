class Contact < ApplicationRecord
    validates_presence_of :kind
    validates_presence_of :address
    
    


    belongs_to :kind, optional: true
    has_many :phones 
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

    # def as_json(options={})
    #     super(
    #         root: true,
    #         include: :kind
    #     )
    # end
end
