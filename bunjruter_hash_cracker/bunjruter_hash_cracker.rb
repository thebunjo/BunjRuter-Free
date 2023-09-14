$VERBOSE = nil

require 'tk'
require 'colorize'
require 'digest'

# Content
root_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_hash_cracker.png')
font_name = "Calibri"
font_size = 10
custom_font = TkFont.new(family: font_name, size: font_size)

root = TkRoot.new
root.title("Bunjruter - Hash Cracker")
root.geometry("230x370")
root.resizable(false, false)
root.iconphoto(root_icon)

# Label Frame
root_label_frame = TkLabelFrame.new(root, text: "Hash Cracker", font: custom_font, relief: 'raised', borderwidth: 1)
root_label_frame.place(x: 10, y: 5, width: 210, height: 350)

# Enter Hash Stage

$enter_hash_label = TkLabel.new(root) do
  font custom_font
  text "Hash:"
  place(x: 20, y:30)
end

$enter_hash_text = TkText.new(root) do
  font custom_font
  width 26
  height 3
  place(x: 20, y:55)
end

$enter_wlist_label = TkLabel.new(root) do
  font custom_font
  text "Wordlist Path:"
  height 1
  place(x: 20, y:115)
end

$enter_wlist_text = TkText.new(root) do
  font custom_font
  width 26
  height 1
  place(x: 20, y:140)
end

output_label = TkLabel.new(root) do
  font custom_font
  text "Output:"
  place(x: 20, y:170)
end

$output_text = TkText.new(root) do
  font custom_font
  width 26
  height 7
  place(x: 20, y:190)
end

$enter_wlist_text.insert('1.0', "./bunjruter_hash_cracker/wordlist.txt")

$algorithms = ['MD5', 'SHA1', 'SHA256', 'SHA512']
$algorithm_var = TkVariable.new
$algorithm_var.value = $algorithms[0]

$algorithm_menu = TkOptionMenubutton.new(root, $algorithm_var, *$algorithms, fg: "white", bg: "#A30039")
$algorithm_menu.place(x: 20, y:320)

# Crack button

crack_button = TkButton.new(root) do
  text "Crack The Hash"
  fg "white"
  bg "#A30039"
  place(x: 115, y: 320)
  command do
    hash_value = $enter_hash_text.get('1.0', 'end-1c')
    wordlist_path = $enter_wlist_text.get('1.0', 'end-1c')
    selected_algorithm = $algorithm_var.value.downcase
    $output_text.delete("1.0", "end")

    Thread.new do
      case selected_algorithm
      when 'md5'
        digest = Digest::MD5
      when 'sha1'
        digest = Digest::SHA1
      when 'sha256'
        digest = Digest::SHA256
      when 'sha512'
        digest = Digest::SHA512
      else
        $output_text.insert('1.0', "Invalid hash algorithm: #{selected_algorithm}")
        Thread.exit
      end

      crack_hash(digest, hash_value, wordlist_path)
    end
  end

  def crack_hash(digest, hash_value, wordlist_path)
    passwords = File.readlines(wordlist_path)
    passwords.each do |password|
      password = password.chomp
      password_hash = digest.hexdigest(password)
      if password_hash == hash_value
        $output_text.insert('1.0', "Cracked: #{password}")
        return
      end
    end
    $output_text.insert('1.0', "Password not found.")
  end

end

Tk.mainloop
