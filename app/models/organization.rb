class Organization < ApplicationRecord

        #has_many :competitions
        # for the time being we will remove this association and its constraint
        belongs_to :customer

        validates_uniqueness_of :name,
                message: "has been taken."
        validates_presence_of :name,
                message: "must have a value."


end
