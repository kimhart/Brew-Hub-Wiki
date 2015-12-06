class Article < ActiveRecord::Base
  belongs_to :editor, class_name: "User"
  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :categories
end
