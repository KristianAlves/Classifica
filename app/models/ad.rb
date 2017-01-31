class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Validates
  validates :title, :description, :picture, :category, :finish_date, presence: true
  validates :price, numericality: {greater_than: 0}

  # Paperclip
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


  # Scopes
  scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc)}

  # gem money-rails
  monetize :price_cents

end
