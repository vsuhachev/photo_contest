module ContestPhotosHelper
  def form_target(parent, child)
    case action_name
      when 'edit'
        edit_contest_path(parent, child)
      when 'new'
        new_contest_photo_path(parent)
      else
        fail "Uups... form_target failed for: #{action_name}"
    end
  end
end
