# BunjruterV1.1

 Bunjruter - Multi-Tool GUI Application

![Ekran görüntüsü 2023-09-14 211703](https://github.com/BunjoThe/BunjruterV1.1/assets/138582603/bfea2ab7-3ad2-4f52-90a8-d50492dfda75)


## How to Install

# Kali Linux / Parrot OS

sudo apt update &&
sudo apt install ruby &&
sudo apt install git &&
git clone https://github.com/BunjoThe/BunjruterV1.1.git &&
cd BunjruterV1.1 &&
sudo gem install bundler &&
bundle install &&
sudo apt-get install tcl-dev tk-dev &&
sudo gem install tk -- --with-tcltkversion=8.6 \
--with-tcl-lib=/usr/lib/x86_64-linux-gnu \
--with-tk-lib=/usr/lib/x86_64-linux-gnu \
--with-tcl-include=/usr/include/tcl8.6 \
--with-tk-include=/usr/include/tcl8.6 \
--enable-pthread &&
sudo chmod +x bunjruter_main.rb &&
ruby bunjruter_main.rb


# Windows

Install ruby : https://rubyinstaller.org/downloads/
Install Bunjruter : https://github.com/BunjoThe/BunjruterV1.1.git
cd BunjruterV1.1 &
gem install bundler &
bundle install &
ruby.exe bunjruter_main.rb

Project Description: Bunjruter - Multi-Tool GUI Application

This project defines a Ruby-based graphical user interface (GUI) application named "Bunjruter." The application offers various user tools and functions to facilitate different data processing and security tasks. Here are the key components and functions of the project:

Main Window and Background: The application features a main window. A visual background has been added to the window, providing users with a pleasant visual experience.

Home Page: The main window contains buttons that grant access to different tools. Users can click on these buttons to open corresponding tools.

Hash Generator: Users can input text and encrypt it using a specific hash algorithm. Different hash types such as MD5, SHA-1, SHA-256, and SHA-512 are supported.

Hash Type Scanner: Users can input a hash value and determine its hash type. The program can infer possible hash types based on the length and character sequence of the input hash value.

Password Generator: Users can create random passwords by selecting the password length, special characters, digits, and letter types.

Base 64 Function: Users can convert text to and from Base64 format. This function is useful for encoding or decoding text when encryption is required.

SSH Cracker: It performs a password attack on the specified server with the entered username and password.

Telnet Cracker: It performs a password attack on the specified server with the entered username and password.

Hash Cracker: Encrypts the given word list and compares it with the entered ciphertext.

Host To IP: Gets the IP address from the entered host.

Whois: Collects information from the entered host

Port Scanner: Scans open TCP ports of the entered target

Banner Grabber: Retrieves banner information from the entered target

Info Page: This feature displays text that explains the purpose and usage of the application. It also emphasizes that the project is intended for educational purposes.

This project aims to provide users with various tools and options to address different data processing and security scenarios. Users can perform fundamental tasks such as text encryption, hash generation, password creation, and security testing. The project's source code is open-source and can be further developed or customized.

#hash_generator #hash #ruby #base64 #dictionary_attack #ssh_brute_force #brute_force #password_generator
