class Pool < ApplicationRecord
  belongs_to :project
  has_many :payments

  def progress
    pledged.to_f / goal * 100
  end

  def backers
    payments.length
  end

  def creator
    project.user
  end

end
