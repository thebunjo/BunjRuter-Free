$VERBOSE = nil
require 'socket'
require 'tk'

# Content
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_banner.png')

root = TkRoot.new
root.geometry("300x350")
root.title("Bunjruter - Banner Grabber")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Banner Grabber", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 280, height: 330)

host_label = TkLabel.new(root) do
  font custom_font
  text "Host:"
  place(x: 20, y: 28)
end

host_entry = TkEntry.new(root)
host_entry.width(35)
host_entry.place(x: 65, y: 30)

output_label = TkLabel.new(root) do
  font custom_font
  text 'Output:'
  place(x: 20, y: 57)
end

output_text = TkText.new(root) do
  font custom_font
  height 13
  width 36
  place(x: 20, y: 85)
end

button = TkButton.new(root) do
  font custom_font
  text "Grab Banner"
  bg '#A30039'
  fg 'white'
  place(x: 100, y: 303)
  command do
    thread = Thread.new do
      port = 80
      host = host_entry.get.to_s
      output_text.delete('1.0', 'end')
      s = TCPSocket.open(host, port)
      s.puts("GET / HTTP/1.1\r\n\r\n")

      response = ""
      while line = s.gets
        response += line
        output_text.insert('1.0', line.chop)
      end
      s.close

      Tk.messageBox(
        'type' => 'ok',
        'icon' => 'info',
        'title' => 'HTTP Response',
        'message' => response
      )
    end
  end

end

root.mainloop
