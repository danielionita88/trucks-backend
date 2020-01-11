class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :title, :make, :model, :model_year, :price, :odometer, :title_status, :city, :description, :photos_urls

  def photos_urls
    object.photos.map{|photo| rails_blob_url(photo, only_path:true)}
  end


end
