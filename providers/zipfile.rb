require 'zip/zip'

action :unzip do
  Chef::Log.info("unzip #{@new_resource.source} => #{@new_resource.path} (overwrite=#{@new_resource.overwrite})")
  # TODO: this needs to move into a definition within the resource.
  # TODO: the firefox extension resource, that is.
  Zip::ZipFile.open("#{Chef::Config[:file_cache_path]}/#{@new_resource.source}") do |zip|
    zip.each do |entry|
      path = ::File.join(@new_resource.path, entry.name)
      FileUtils.mkdir_p(::File.dirname(path))
      zip.extract(entry, path)
    end
  end
end

action :zip do

end
