$VERBOSE = nil # $VERBOSE = false
require 'tk'
require 'base64'

# Content
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_base64_encoder.png')
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)

root = TkRoot.new
root.geometry("280x200")
root.title("Bunjruter - Base64 Encoder")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Base64 Encoder", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 280, height: 180)

enter_text_label = TkLabel.new(root) do
  font custom_font
  text "Enter Text:"
  place(x:30 , y:38)
end

entry_text = TkEntry.new(root) do
  place(x:100 , y:40)
  width 25
end

result_text_label = TkLabel.new(root) do
  font custom_font
  text "Text Result:"
  place(x:30 , y:78)
end

result_entry_text = TkEntry.new(root) do
  place(x:100 , y:80)
  width 25
end


# Crypt Button
crypt_button = TkButton.new(root) do
  text "Encode Text"
  fg "white"
  bg "#A30039"
  place(x: 100, y:130)
  command do
    text_to_encode = entry_text.get
    encoded_text = Base64.encode64(text_to_encode)
    result_entry_text.delete(0, "end")
    result_entry_text.insert(0, encoded_text)
  end
end

Tk.mainloop