class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :location
end
