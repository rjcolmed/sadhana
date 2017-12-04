class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :location, :description
  has_many :tags
  belongs_to :teacher
end
