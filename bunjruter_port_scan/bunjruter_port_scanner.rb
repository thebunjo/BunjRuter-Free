$VERBOSE = nil

require 'tk'
require 'socket'

# Content
font_name = 'Calibri'
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_port_scanner.png')

root = TkRoot.new
root.geometry('250x400')
root.title('Bunjruter - Port Scanner')
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: 'Port Scanner', font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 230, height: 380)

host_label = TkLabel.new(root) do
  font custom_font
  text 'Host:'
  place(x: 20, y: 23)
end

host_entry = TkEntry.new(root)
host_entry.width(25)
host_entry.place(x: 70, y: 25)

port_label = TkLabel.new(root) do
  font custom_font
  text 'Ports:'
  place(x: 20, y: 60)
end

port_entry = TkEntry.new(root)
port_entry.width(25)
port_entry.place(x: 70, y: 62)

port_entry.insert(0, "21,22,23,25,3306")

output_label = TkLabel.new(root) do
  font custom_font
  text 'Output:'
  place(x: 20, y: 97)
end

output_text = TkText.new(root) do
  font custom_font
  height 14
  width 29
  place(x: 20, y: 120)
end

scan_button = TkButton.new(root) do
  font custom_font
  text 'Start Scan'
  bg '#A30039'
  fg 'white'
  place(x: 85, y: 350)
  command do
    host = host_entry.get
    ports = port_entry.get.split(',').map(&:strip)

    output_text.delete(1.0, 'end')

    ports.each do |port_str|
      port = port_str.to_i

      Thread.new do
        begin
          socket = TCPSocket.new(host, port)
          output_text.insert('end', "Port #{port} is open.\n")
          socket.close
        rescue
          output_text.insert('end', "Port #{port} is closed or filtered.\n")
        end

      end
    end
  end
end

Tk.mainloop