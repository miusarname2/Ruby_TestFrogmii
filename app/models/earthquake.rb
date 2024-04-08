class Earthquake < ApplicationRecord

  self.inheritance_column = :custom_type_column

  has_many :comments, dependent: :destroy

end
