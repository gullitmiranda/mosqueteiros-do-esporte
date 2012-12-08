class Project < ActiveRecord::Base
  attr_accessible :title, :image, :body, :name, 
                  :location, :video, :excerpt, :goal, 
                  :expires_at, :published, :featured,
                  :remote_image_url

  validates :title, :image, presence: true
  mount_uploader :image, ProjectImageUploader
end
