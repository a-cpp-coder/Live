# A concern is only responsible for a focused subset of the model's responsibility; the methods in our concern will all be related to the visibility of a model. Let's call our new concern (module) Visible.
module Visible
  # def archived?
  #   status == 'archived'
  # end
  # # method called at the class level
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do # yes, included then check
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # Class methods can also be added to concerns. If we want to display a count of public articles or comments on our main page, we might add a class method to Visible as follows:
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
