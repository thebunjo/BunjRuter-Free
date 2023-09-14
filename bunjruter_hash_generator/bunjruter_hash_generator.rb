$VERBOSE = nil
require 'tk'
require 'digest'

def generate_hash(text, algorithm)
  thread = Thread.new do
    case algorithm
    when 'MD5'
      Digest::MD5.hexdigest(text)
    when 'SHA1'
      Digest::SHA1.hexdigest(text)
    when 'SHA256'
      Digest::SHA256.hexdigest(text)
    when 'SHA512'
      Digest::SHA512.hexdigest(text)
    else
      'Unsupported Algorithm'
    end
  end

  thread.value
end

def main


  # Content
  font_name = "Calibri"
  hash_generator_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_hash_generator.png')
  font_size = 10
  custom_font = TkFont.new(family: font_name, size: font_size)

  root = TkRoot.new
  root.geometry("300x200")
  root.resizable(false, false)
  root.title("Bunjruter - Hash Generator")
  root.iconphoto(hash_generator_icon)

  # Label Frame
  hash_generator_label_frame = TkLabelFrame.new(root, text: "Hash Generator", font: custom_font, relief: 'raised', borderwidth: 1)
  hash_generator_label_frame.place(x: 10, y: 5, width: 280, height: 180)

  # Label
  enter_label = TkLabel.new(hash_generator_label_frame) do
    text "Enter text to hash:"
    place(x: 10, y: 3)
  end

  # Entry Widget
  text_entry = TkEntry.new(hash_generator_label_frame)
  text_entry.width = 40
  text_entry.place(x: 10, y: 22)

  # Label
  generated_label = TkLabel.new(hash_generator_label_frame) do
    text "Generated hash:"
    place(x: 10, y: 42)
  end

  # Entry Widget
  generated_hash_entry = TkEntry.new(hash_generator_label_frame)
  generated_hash_entry.width = 40
  generated_hash_entry.place(x: 10, y: 62)

  # Algorithm Selection
  algorithm_label = TkLabel.new(hash_generator_label_frame) do
    text "Select algorithm:"
    place(x: 10, y: 90)
  end

  algorithms = ['MD5', 'SHA1', 'SHA256', 'SHA512']
  algorithm_var = TkVariable.new
  algorithm_var.value = algorithms[0]

  algorithm_menu = TkOptionMenubutton.new(hash_generator_label_frame, algorithm_var, *algorithms, fg: "white", bg: "#A30039")
  algorithm_menu.place(x: 10, y: 110)

  # Generate Button
  generate_button = TkButton.new(hash_generator_label_frame) do
    text "Generate Hash"
    fg "white"
    bg "#A30039"
    command do
      text = text_entry.get
      algorithm = algorithm_var.value
      result = generate_hash(text, algorithm)

      # Update the generated hash entry widget with the result
      generated_hash_entry.delete(0, "end")  # Önceyi temizle
      generated_hash_entry.insert("end", result)
    end
    place(x: 180, y: 110)
  end

  Tk.mainloop
end

if __FILE__ == $0
  main
end