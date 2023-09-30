#!/bin/bash

# Update package lists and install Ruby and Git
sudo apt update &&
sudo apt install -y ruby git &&

# Install Ruby dependencies
sudo gem install bundler &&
bundle install &&

# Install necessary packages for Tk library
sudo apt-get install -y tcl-dev tk-dev &&

# Install Tk library for Ruby
sudo gem install tk -- --with-tcltkversion=8.6 --with-tcl-lib=/usr/lib/x86_64-linux-gnu --with-tk-lib=/usr/lib/x86_64-linux-gnu --with-tcl-include=/usr/include/tcl8.6 --with-tk-include=/usr/include/tcl8.6 --enable-pthread &&

# Grant execution permission to the main Ruby script
sudo chmod +x bunjruter_main.rb &&

# Run the Ruby script
ruby bunjruter_main.rb
