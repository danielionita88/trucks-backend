class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :title, :make, :model, :model_year, :price, :odometer, :title_status, :description,:address,:lat,:lng,:photos_urls

  def photos_urls
    object.photos.map{|photo| photo.service_url} 
  end


end
