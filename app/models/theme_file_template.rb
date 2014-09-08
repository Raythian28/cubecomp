class ThemeFileTemplate < ActiveRecord::Base
  belongs_to :theme
  validates :theme, presence: true

  validates :filename, presence: true
  validates :filename, uniqueness: { scope: :theme }, allow_nil: true, allow_blank: true

  validates :content, presence: true
end