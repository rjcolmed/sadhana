class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :location, :description
end
