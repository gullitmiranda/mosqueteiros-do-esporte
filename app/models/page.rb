class Page < ActiveRecord::Base
  attr_accessible :body, :published, :title, :slug

  validates :title, presence: true

  before_save :update_slug

  def update_slug
    if slug.blank?
      self.slug = title.parameterize
    end

    if slug != slug.parameterize
      self.slug = slug.parameterize
    end
  end

end
