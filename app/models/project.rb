class Project < ActiveRecord::Base
  attr_accessible :title, :image, :body, :name, 
                  :location, :video, :excerpt, :goal, 
                  :expires_at, :published, :featured,
                  :remote_image_url, :success, :category

  validates :title, :category, :image, :excerpt, presence: true
  validates :title, length: { maximum: 60 }
  validates :excerpt, length: { maximum: 135 }
  has_many :payments, dependent: :destroy

  mount_uploader :image, ProjectImageUploader

  before_save :update_status

  def self.published
    where(published: true)
  end

  def self.featured
    where(featured: true)
  end

  def self.ordered_by_date
    order('updated_at DESC')
  end

  def self.active
    published.where('expires_at >= ?', Date.today)
  end

  def backers
    payments.completed.collect(&:user).uniq(&:id)
  end

  def active?
    published? and days_left > 0
  end

  def days_left
    (expires_at - Date.today).to_i
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  def progress
    ((pledged / goal * 100).abs).round.to_i
  end

  def pledged
    payments.completed.pluck(:amount).sum
  end

  def update_status
    self.success = pledged >= goal
    true
  end
end
