class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :make, :model, :model_year, :price, :odometer, :title_status, :city, :description
end
