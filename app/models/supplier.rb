# frozen_string_literal: true

# This supplier with supplier record
class Supplier < ApplicationRecord
  # def products
  #   Product.where(supplier_id: id)
  # end
  has_many :products # active_record methods
end
