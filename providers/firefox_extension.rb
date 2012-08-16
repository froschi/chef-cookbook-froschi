include Froschi::Helper

require 'zip/zip'

action :install do

# 1. always load from data bag. exit if there is none that matches the extension name.
# 2. construct target directory. if it exists, it's already installed. stop.
# 3. construct download path from filename and app_id
# 4. download
# 5. create target directory.
# 6. extract zip (xpi) file.

end

action :remove do

# 1. always load from data bag. exit if there is none that matches the extension name.
# 2. determine addon path from addon id
# 3. recursively remove directory.

end
