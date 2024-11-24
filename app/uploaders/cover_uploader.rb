require "image_processing/mini_magick"

class CoverUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: "is too large (max is 5 MB)"
    validate_mime_type_inclusion ["image/jpeg", "image/png"]
  end

  plugin :derivatives

  Attacher.derivatives(:thumb) do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large: magick.resize_to_fill(800, 800),
      medium: magick.resize_to_limit(400, 400),
      small: magick.resize_to_limit(80, 80)
    }
  end
end
