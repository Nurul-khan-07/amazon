class Product < ApplicationRecord
  belongs_to :productable, polymorphic: true #polymorphic association
  belongs_to :users
  belongs_to :suppliers
  has_many :users, through: :suppliers


  # validates :pr_name, presence: true,length: { minimum: 5 }
  # validates :pr_price, presence: true,length: { minimum: 1 }
  # validates :pr_category, presence: true,length: { maximun:100 }

  # before_validation :ensure_pr_name_has_a_value

  before_create do
    self.pr_price = pr_name.capitalize if pr_price.blank?
  end

  def ensure_pr_name_has_a_value
    if pr_name.nil?
      self.pr_name = pr_price unless pr_price.blank?
    end
  end

end
