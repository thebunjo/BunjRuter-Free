$VERBOSE = nil
require 'tk'

# Content
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_pass_generator.png')
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)

root = TkRoot.new
root.geometry("270x200")
root.title("Bunjruter - Base64 Encoder")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Password Generator", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 280, height: 180)

generated_password_text = TkLabel.new(root) do
  font custom_font
  text "Password:"
  place(x: 20, y: 38)
end

generated_password_entry = TkEntry.new(root) do
  place(x: 90, y: 40)
  width 25
end

length_text_label = TkLabel.new(root) do
  font custom_font
  text "Length:"
  place(x: 20, y: 78)
end

length_entry_text = TkEntry.new(root) do
  place(x: 90, y: 80)
  width 25
end

max_length_label = TkLabel.new(root) do
  font custom_font
  text "Maximum length: 9999 characters."
  fg "red"
  place(x: 38, y: 160)
end

# Special characters to be included in the password
special_chars = '!@#$%^&*()_+-=[]{}|;:,.<>?'

# Crypt Button
crypt_button = TkButton.new(root) do
  text "Generate Password"
  fg "white"
  bg "#A30039"
  place(x: 80, y: 120)
  command do
    password_thread = Thread.new do
      password_length = length_entry_text.get.to_i
      chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + special_chars.split('')

      # Check if the requested password length exceeds 4 characters
      if password_length > 9999
        password_length = 9999
      end

      password = Array.new(password_length) { chars.sample }.join
      generated_password_entry.delete(0, "end")
      generated_password_entry.insert(0, password)
    end
  end
end

Tk.mainloop
