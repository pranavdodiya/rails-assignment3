class Book < ApplicationRecord
  has_many_attached :cover_photos 
  belongs_to :author
  validates :cover_photos, aspect_ratio: :square

  validate :cover_photos_type
  validates :cover_photos, attached: true, size: { less_than: 1.megabytes , message: 'is too large' }

  private

  def cover_photos_type
    if cover_photos.attached? == false
      errors.add(:cover_photos, "is missing!")
    end
    
   self.cover_photos.each do |image|
      if !image.content_type.in?(%('image/png'))
        errors.add(:cover_photos, "needs to be  png!")
      end
      
    end
  end
  


end
