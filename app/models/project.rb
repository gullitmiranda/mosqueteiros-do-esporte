class Project < ActiveRecord::Base
  attr_accessible :title, :image, :body, :name, 
                  :location, :video, :excerpt, :goal, 
                  :expires_at, :published, :featured,
                  :remote_image_url

  validates :title, :image, presence: true
  has_many :payments, dependent: :destroy

  mount_uploader :image, ProjectImageUploader

  def self.published
    where(published: true)
  end

  def self.featured
    where(featured: true)
  end

  def self.ordered_by_date
    order('updated_at DESC')
  end

  def days_left
    (expires_at - Date.today).to_i
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  # TODO: implement
  def progress
    ((pledged / goal * 100).abs).round.to_i
  end

  def pledged
    payments.completed.pluck(:amount).sum
  end
end
