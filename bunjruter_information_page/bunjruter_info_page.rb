$VERBOSE = nil # $VERBOSE = false
require 'tk'

def main
  # Content
  info_text = "This project was made for educational \npurposes and is still being developed.\n\n Contact: bunjothe@gmail.com\n Github: https://github.com/BunjoThe"
  font_name = "Calibri"
  font_size = 10
  custom_font = TkFont.new(family: font_name, size: font_size)

  # Information Main Page
  infoMain = TkRoot.new()
  infoMain.geometry("290x200")
  infoMain.title("Bunjruter - Information")
  infoMain.resizable(false, false)
  infoMain_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_information.png')
  infoMain.iconphoto(infoMain_icon)

  # Information LabelFrame
  information_labelframe = TkLabelFrame.new(infoMain) do
    font custom_font
    text "Information"
    width 265
    height 175
    place(x: 10, y: 10)
  end

  # Information Label
  information_label = TkLabel.new(infoMain) do
    width 34
    height 9
    font custom_font
    fg "black"
    text info_text
    place(x: 20, y: 32)
  end

  Tk.mainloop
end

if __FILE__ == $0
  main
end
