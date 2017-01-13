require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'), # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :logging

Shrine.plugin :backgrounding

Shrine::Attacher.promote { |data| ImagePromoteJob.perform_later(data) }
Shrine::Attacher.delete { |data| ImageDeleteJob.perform_later(data) }
