#froschi_zipfile "/usr/share/mozilla/extensions/\{ec8030f7-c20a-464f-9b0e-13a3a9e97384\}/isreaditlater@ideashower.com" do
#  source "read_it_later-3.0.0-fx.xpi"
#  action :unzip
#end

extensions = %w/
  adblockplus
  evernote-webclipper
  pocket
  zotero
/

extensions.each do |ext|
  froschi_firefox_extension ext do
    action :install
  end
end
