class Project < ActiveRecord::Base
  attr_accessible :title, :image, :body, :name, 
                  :location, :video, :excerpt, :goal, 
                  :expires_at, :published, :featured,
                  :remote_image_url

  validates :title, :image, presence: true

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

  # TODO: implement
  def progress
    30
  end
end
