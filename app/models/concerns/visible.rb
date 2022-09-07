module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['Public', 'Private', 'Archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'Public').count
    end
  end

  def archived?
    status == 'Archived'
  end
end