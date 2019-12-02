class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :credits
  has_one :organization
  
  def create(*args, &block)
    needsOrg = new_record?
    super *args, &block
    puts "Customer create: Needs Organization? ",needsOrg.inspect()
    if needsOrg
      org = Organization.create()
      org.customer_id = id
      org.save
    end
  end

  def save(*args, &block)
    needsOrg = new_record?
    super *args, &block
    puts "Customer save: Needs Organization? ",needsOrg.inspect()
    if needsOrg
      puts "  Creating Organization..."
      org = Organization.create(customer_id: self.id, name: self.email.split('@')[1])
      #puts "  Saving Organization..."
      #org.save!
    end
  end

end
