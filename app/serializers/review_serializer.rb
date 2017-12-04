class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at
  belongs_to :student
end
