require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'), # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data

Shrine.plugin :backgrounding

Shrine::Attacher.promote_block { |data| ImagePromoteJob.perform_later(data) }
Shrine::Attacher.destroy_block { |data| ImageDeleteJob.perform_later(data) }
