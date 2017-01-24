require 'open3'

def run_docker(command)
  Dir.chdir(Rails.root) do
    Open3.popen2e(command) do |_i, oe, _thread|
      oe.each { |line| puts line }
    end
  end
end

namespace :docker do
  task :build_assets do
    Rake::Task['assets:clobber'].invoke
    Rake::Task['assets:precompile'].invoke
  end

  desc 'build app image'
  task :build => :build_assets do
    run_docker('docker build --force-rm --tag vsuhachev/photo_contest --file Dockerfile . ')
  end

  desc 'push app image'
  task :push do
    run_docker('docker push vsuhachev/photo_contest')
  end
end