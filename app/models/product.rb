# frozen_string_literal: true

# This Product with record products
class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :users

  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :price, length: { in: 0.00..10_000_000.00 }
  validates :price, numericality: { greater_than: 0 }
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :image_url, length: { maximum: 254 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def discounted?
    price.to_i < 10.to_i
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax.to_f
  end
end
