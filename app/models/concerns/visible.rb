module Visible
  extend ActiveSupport::Concern # included, class_methods

  VALID_STATUSES = ['public', 'private', 'archived']

  # all code inside 'included' are executed in the class that includes this module
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # all methods inside 'class_methods' are defined in the class that includes this module
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
