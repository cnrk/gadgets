class Gadget < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  def self.search(search, user_id)
    if search
      where('name LIKE ? and user_id = ?', "%#{search}%", user_id)
    else
      where('user_id = ?', user_id)
    end
  end
end
