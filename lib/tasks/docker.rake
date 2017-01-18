require 'open3'

namespace :docker do
  task :build_assets do
    Rake::Task['assets:clobber'].invoke
    Rake::Task['assets:precompile'].invoke
  end

  desc 'build app image'
  task :build => :build_assets do
    Dir.chdir(Rails.root) do
      Open3.popen2e('docker build --force-rm --tag vsuhachev/photo_contest --file Dockerfile . ') do |_i, oe, _thread|
        oe.each { |line| puts line }
      end
    end
  end
end