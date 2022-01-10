class User < ApplicationRecord
  rolify
  has_many :products, as: :productable # polymorphic association

  has_many :suppliers
  has_many :users, through: :suppliers

  # validates :name, presence: true,length: { minimum: 5 }
  # validates :email,presence:true,uniqueness:true


end
