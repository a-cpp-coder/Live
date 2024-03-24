# Aticle model
class Article < ApplicationRecord
  include Visible

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: {minimum:10, maximum:300}

  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES}

  # def archived?
  #   status == 'archived'
  # end
end
