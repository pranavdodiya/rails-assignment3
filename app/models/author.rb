class Author < ApplicationRecord
  has_one_attached :profile_picture
  has_many :books, dependent: :destroy

  validates :profile_picture, aspect_ratio: :square

  validate :profile_picture_type
  validates :profile_picture, attached: true, size: { less_than: 1.megabytes , message: 'is too large' }

  private

  def profile_picture_type
    
    if profile_picture.attached? == false
      errors.add(:profile_picture, "is missing!")
    end
    

    if !profile_picture.content_type.in?(%('image/png'))
      errors.add(:profile_picture, "needs to be  png!")
    end
    


  end
  

end
