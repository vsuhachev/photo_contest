require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :determine_mime_type
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :processing
  plugin :versions
  plugin :delete_raw

  Attacher.validate do
    validate_max_size 5*1024*1024, message: 'is too large (max is 5 MB)'
    validate_mime_type_inclusion ['image/jpeg', 'image/png']
  end

  process(:store) do |io, context|
    original = io.download

    large = resize_to_limit!(original, 800, 800)
    medium = resize_to_limit(large, 300, 300)
    small = resize_to_limit(medium, 80, 80)

    { original: io, large: large, medium: medium, small: small }
  end
end
