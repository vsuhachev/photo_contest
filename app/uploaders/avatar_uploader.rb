require 'image_processing/mini_magick'

class AvatarUploader < Shrine
  include ImageProcessing::MiniMagick

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

    large = resize_to_fill(original, 400, 400)
    medium = resize_to_limit(large, 200, 200)
    small = resize_to_limit(medium, 80, 80)

    original.delete

    { large: large, medium: medium, small: small }
  end

  def generate_location(_io, _context)
    ['avatars', super].compact.join('/')
  end
end
