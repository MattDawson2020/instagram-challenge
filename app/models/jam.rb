class Jam < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.like(jam_id)
    jam = Jam.find_by(id: jam_id)
    jam.update(likes: (jam.likes + 1))
  end

end
