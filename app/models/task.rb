class Task < ApplicationRecord
  validates :description, presence: true

  def done?
    done
  end
end
