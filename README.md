# BunjruterV1.1

 Bunjruter - Multi-Tool GUI Application

- How to install ? 

- Kali Linux / Parrot OS
"""
apt update
apt install ruby
apt install git
git clone https://github.com/BunjoThe/BunjruterV1.1.git
cd BunjruterV1.1
gem install bundler
bundle install
ruby bunjruter_main.rb
"""

- Windows
"""
Install ruby : https://rubyinstaller.org/downloads/
Install Bunjruter : https://github.com/BunjoThe/BunjruterV1.1.git
cd BunjruterV1.1
gem install bundler
bundle install
ruby.exe bunjruter_main.rb
"""

Project Description: Bunjruter - Multi-Tool GUI Application

This project defines a Ruby-based graphical user interface (GUI) application named "Bunjruter." The application offers various user tools and functions to facilitate different data processing and security tasks. Here are the key components and functions of the project:

Main Window and Background: The application features a main window. A visual background has been added to the window, providing users with a pleasant visual experience.

Home Page: The main window contains buttons that grant access to different tools. Users can click on these buttons to open corresponding tools.

Hash Generator: Users can input text and encrypt it using a specific hash algorithm. Different hash types such as MD5, SHA-1, SHA-256, and SHA-512 are supported.

Hash Type Scanner: Users can input a hash value and determine its hash type. The program can infer possible hash types based on the length and character sequence of the input hash value.

Password Generator: Users can create random passwords by selecting the password length, special characters, digits, and letter types.

Base 64 Function: Users can convert text to and from Base64 format. This function is useful for encoding or decoding text when encryption is required.

Info Page: This feature displays text that explains the purpose and usage of the application. It also emphasizes that the project is intended for educational purposes.

This project aims to provide users with various tools and options to address different data processing and security scenarios. Users can perform fundamental tasks such as text encryption, hash generation, password creation, and security testing. The project's source code is open-source and can be further developed or customized.

#hash_generator #hash #ruby #base64 #dictionary_attack #ssh_brute_force #brute_force #password_generator
