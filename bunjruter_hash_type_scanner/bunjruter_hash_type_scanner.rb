$VERBOSE = nil
require 'tk'

def main
  def detect_hash_type(hash)
    case hash.length
    when 0
      return 'Empty.'
    when 32
      return 'MD5'
    when 40
      return 'SHA1'
    when 64
      return 'SHA256'
    when 128
      return 'SHA512'
    else
      return 'Unknown'
    end
  end

  def get_message(hash_type)
    case hash_type
    when 'Empty.'
      return 'Empty.'
    when 'MD5'
      return 'It could be MD5.'
    when 'SHA1'
      return 'It could be SHA1.'
    when 'SHA256'
      return 'It could be SHA256.'
    when 'SHA512'
      return 'It could be SHA512.'
    else
      return 'Unknown hash type.'
    end
  end

  # Content
  font_name = "Calibri"
  font_size = 10
  custom_font = TkFont.new(family: font_name, size: font_size)
  hash_type_scanner_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_hash_type.png')

  # Main
  hash_type_main = TkRoot.new
  hash_type_main.geometry("250x200")
  hash_type_main.title("Bunjruter - Hash Type Scanner")
  hash_type_main.resizable(false, false)
  hash_type_main.iconphoto(hash_type_scanner_icon)

  # Label Frame
  hash_type_labelframe = TkLabelFrame.new(hash_type_main, text: "Hash Type Scanner", font: custom_font, relief: 'raised', borderwidth: 1)
  hash_type_labelframe.place(x: 10, y: 5, width: 230, height: 180)

  # Label
  enter_label = TkLabel.new(hash_type_labelframe) do
    text "Enter hash:"
    place(x: 75, y: 5)
  end

  # Entry Widget
  text_entry = TkEntry.new(hash_type_labelframe)
  text_entry.width = 31
  text_entry.place(x: 17, y: 30)

  # Label
  message_label = TkLabel.new(hash_type_labelframe) do
    text "Hash Type:"
    place(x: 75, y: 55)
  end

  # Entry Widget
  message_entry = TkEntry.new(hash_type_labelframe)
  message_entry.width = 31
  message_entry.place(x: 17, y: 80)

  # Detect Button
  detect_button = TkButton.new(hash_type_labelframe) do
    text "Detect Hash Type"
    fg "white"
    bg "#A30039"
    place(x: 55, y: 110)

    command do
      input_hash = text_entry.get
      hash_type = detect_hash_type(input_hash)
      message = get_message(hash_type)
      message_entry.delete(0, "end")
      message_entry.insert("end", message)
    end
  end

  Tk.mainloop
end

if __FILE__ == $0
  main
end
