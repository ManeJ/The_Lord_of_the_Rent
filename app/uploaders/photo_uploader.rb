class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true

  process convert: 'jpg'

  version :thumbnail do
    cloudinary_transformation width: 100, height: 100, crop: :thumb, gravity: :face
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
