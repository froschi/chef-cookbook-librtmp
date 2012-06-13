packages = Array.new

case node[:lsb][:codename]
when "precise"
  include_recipe "libgcrypt"
  include_recipe "libgnutls"

  packages |= %w/
    librtmp0
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
