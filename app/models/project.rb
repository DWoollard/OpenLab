class Project < ApplicationRecord
  belongs_to :user
  has_one :pool
  has_many :logs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_one :video, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :title, presence: true, uniqueness: true

  scope :posted?, -> { where(posted: true) }

  def self.search(term)
    where(['title LIKE ?', "%#{term}%"])
  end

  def postable?
    pool ? true : false
  end
end
