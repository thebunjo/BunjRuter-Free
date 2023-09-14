$VERBOSE = nil
require 'tk'
require 'resolv'

# Content
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_host2ip.png')


root = TkRoot.new
root.geometry("200x150")
root.title("Bunjruter - Host To IP")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Host To IP", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 280, height: 130)

host_label = TkLabel.new(root) do
  font custom_font
  text "Host:"
  place(x: 15, y: 28)
end

host_entry = TkEntry.new(root)
host_entry.place(x: 55, y: 30)

host_entry.insert(0, "example.com")

ip_label = TkLabel.new(root) do
  font custom_font
  text "IP:"
  place(x: 15, y: 68)
end

ip_text = TkText.new(root) do
  width 15
  height 1
  place(x: 55, y: 68)
end

find_button = TkButton.new(root) do
  text "Find Host IP"
  fg "white"
  bg "#A30039"
  place(x: 55, y: 100)
  command do
    Thread.new do
      hostname = host_entry.get
      begin
        Resolv::DNS.open do |dns|
          ip_address = dns.getaddress(hostname)
          root.after(0) { ip_text.insert("end", "#{ip_address}\n") }
        end
      rescue Resolv::ResolvError => e
        root.after(0) { ip_text.insert("end", "Error: #{e.message}\n") }
      end
    end
  end
end

Tk.mainloop
