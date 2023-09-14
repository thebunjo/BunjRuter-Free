$VERBOSE = nil
require 'tk'
require 'whois'

# Content
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_whois.png')

root = TkRoot.new
root.geometry("400x450")
root.title("Bunjruter - Whois")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Whois", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 380, height: 420)

host_label = TkLabel.new(root) do
  font custom_font
  text "Host:"
  place(x: 20, y: 25)
end

host_entry = TkText.new(root)
host_entry.width(30)
host_entry.height(1)
host_entry.place(x: 80, y: 25)

host_entry.insert("1.0", "example.com")

whois_label = TkLabel.new(root) do
  font custom_font
  text "Whois Info:"
  place(x: 20, y: 60)
end

whois_text = TkText.new(root) do
  width 44
  height 18
  place(x: 20, y: 85)
end

find_button = TkButton.new(root) do
  text "Find Whois"
  fg "white"
  bg "#A30039"
  place(x: 160, y: 390)
  command do
    Thread.new do
      hostname = host_entry.get("1.0", "end").strip
      whois_info = Whois.whois(hostname)
      whois_text.delete(1.0, :end)
      whois_text.insert('end', whois_info.to_s)
    end
  end
end

Tk.mainloop
