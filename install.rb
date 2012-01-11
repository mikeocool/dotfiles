#!/usr/bin/env ruby

# update git submodules

`git submodule init && git submodule update`

# update symlinks
# inspired by http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/
  target = File.join(home, ".#{file}")
  if File.exists? target then
    if File.symlink? target then
      puts "Skipping .#{file} (already installed)"
    else
      puts "Skipping .#{file} (already exists)"
    end
    next
  end
  puts "Installing .#{file}"
  `ln -s #{File.expand_path file} #{target}`
end
