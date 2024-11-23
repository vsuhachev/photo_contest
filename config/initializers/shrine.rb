require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store") # permanent
}

Shrine.plugin :model
Shrine.plugin :validation
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data

Shrine.plugin :derivatives,
  create_on_promote: true, # automatically create derivatives on promotion
  versions_compatibility: true # handle versions column format

Shrine.plugin :backgrounding

Shrine::Attacher.promote_block do
  ImagePromoteJob.perform_later(self.class.name, record.class.name, record.id, name.to_s, file_data)
end

Shrine::Attacher.destroy_block do
  ImageDeleteJob.perform_later(self.class.name, data)
end
