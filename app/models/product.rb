# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :price, length: { in: 0.00..10_000_000.00 }
  validates :price, numericality: { greater_than: 0 }
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :image_url, length: { maximum: 254 }


  def discounted?
    if price.to_i < 10.to_i
      true
    else
      false
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax.to_f
  end
end

