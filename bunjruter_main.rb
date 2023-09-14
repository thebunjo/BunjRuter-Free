$VERBOSE = nil # $VERBOSE = false
require 'tk'

def open_bunjruter_information_page
  open_page_info_thread = Thread.new do
    system("ruby ./bunjruter_information_page/bunjruter_info_page.rb")
  end
end

def open_wordlist_data_page
  open_page_wordlist_data = Thread.new do
    system("ruby ./bunjruter_wordlist_data/bunjruter_wordlist_data.rb")
  end
end

def open_hash_generator_page
  open_page_hash_generator = Thread.new do
    system("ruby ./bunjruter_hash_generator/bunjruter_hash_generator.rb")
  end
end

def open_hash_type_page
  open_page_hash_type = Thread.new do
    system("ruby ./bunjruter_hash_type_scanner/bunjruter_hash_type_scanner.rb")
  end
end

def open_base64_encoder_page
  open_page_base64e = Thread.new do
    system("ruby ./bunjruter_base64_encoder/bunjruter_base64_encoder.rb")
  end
end

def open_base64_decoder_page
  open_page_base64e = Thread.new do
    system("ruby ./bunjruter_base64_decoder/bunjruter_base64_decoder.rb")
  end
end

def open_passg_page
  open_page_base64e = Thread.new do
    system("ruby ./bunjruter_password_generator/bunjruter_password_generator.rb")
  end
end

def open_ssh_page
  open_page_ssh = Thread.new do
    system("ruby ./bunjruter_ssh_cracker/bunjruter_ssh.rb")
  end
end

def open_telnet_page
  open_page_ftp = Thread.new do
    system("ruby ./bunjruter_telnet_cracker/bunjruter_telnet_cracker.rb")
  end
end

def open_hash_cracker_page
  open_page_hashc = Thread.new do
    system("ruby ./bunjruter_hash_cracker/bunjruter_hash_cracker.rb")
  end
end

def open_host2ip_page
  open_page_host2ip = Thread.new do
    system("ruby ./bunjruter_host_to_ip/bunjruter_host2ip.rb")
  end
end

def open_whois_page
  open_page_host2ip = Thread.new do
    system("ruby ./bunjruter_whois/bunjruter_whois.rb")
  end
end

def port_scanner_page
  open_page_portscannertcp = Thread.new do
    system("ruby ./bunjruter_port_scan/bunjruter_port_scanner.rb")
  end
end

def banner_page
  open_page_portscannertcp = Thread.new do
    system("ruby ./bunjruter_banner_grabber/bunjruter_banner_grabber.rb")
  end
end

def main
  # Content
  rutersMain_icon = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_icons/bunjruter_main.png')
  rutersMain_wallpaper = TkPhotoImage.new(file: './project_bunjruter_contents/project_bunjruter_wallpapers/bunjruter.png')
  font_name = "Calibri"
  font_size = 10
  custom_font = TkFont.new(family: font_name, size: font_size)

  # BunjRuter Main Project
  rutersMain = TkRoot.new
  rutersMain.title = "Project Bunjruter - Main"
  rutersMain.geometry("400x395+730+270")
  rutersMain.resizable(false, false)
  rutersMain.iconphoto(rutersMain_icon)
  background_label = TkLabel.new
  background_label.place(relwidth: 1, relheight: 1)
  background_label.configure(image: rutersMain_wallpaper)

  background_label = TkLabel.new(rutersMain) do
    image rutersMain_wallpaper
    place(relwidth: 1, relheight: 1)
  end

  # Passwords LabelFrame

  bunjruter_passwords_label_frame = TkLabelFrame.new(rutersMain, text: "Passwords", font: custom_font, relief: 'raised', borderwidth: 1)
  bunjruter_passwords_label_frame.place(x: 10, y: 5, width: 120, height: 160)

  # Cracking LabelFrame

  bunjruter_cracking_label_frame = TkLabelFrame.new(rutersMain, text: "Cracking", font: custom_font, relief: 'raised', borderwidth: 1)
  bunjruter_cracking_label_frame.place(x: 140, y: 5, width: 120, height: 160)

  # Discover LabelFrame

  bunjruter_discover_label_frame = TkLabelFrame.new(rutersMain, text: "Discover", font: custom_font, relief: 'raised', borderwidth: 1)
  bunjruter_discover_label_frame.place(x: 270, y: 5, width: 120, height: 160)


  bunjruter_creator_label = TkLabel.new(rutersMain) do
    text "Written By TheBunjo."
    font custom_font
    width 16
    place(x: 140, y: 370)
  end


  # Buttons
  button_style = {
    fg: "white",
    bg: "#A30039",
    font: custom_font,
    relief: "raised",
    borderwidth: 1,
    width: 11,
    padx: 10,
    pady: 5,
    compound: 'center'
  }

  # Passwords Stage

  bunjruter_base64_encoder_button = TkButton.new(rutersMain, button_style) do
    text "Base64 Encoder"
    command { open_base64_encoder_page }
    place(x: 20, y: 24)
  end

  bunjruter_hash_generator_button = TkButton.new(rutersMain, button_style) do
    text "Hash Generator"
    command {open_hash_generator_page}
    place(x: 20, y: 57)
  end

  bunjruter_hash_type_scan_button = TkButton.new(rutersMain, button_style) do
    text "Hash Type Scan"
    place(x: 20, y: 90)
    command {open_hash_type_page}
  end

  bunjruter_password_generator_button = TkButton.new(rutersMain, button_style) do
    text "Pass Generator"
    place(x: 20, y: 123)
    command { open_passg_page }
  end

  # Cracking Stage

  bunjruter_cracking_label_frame = TkLabelFrame.new(rutersMain, text: "Cracking", font: custom_font, relief: 'raised', borderwidth: 1)
  bunjruter_cracking_label_frame.place(x: 140, y: 5, width: 120, height: 160)

  bunjruter_base_64_button = TkButton.new(rutersMain, button_style) do
    text "Base64 Decoder"
    place(x: 150, y: 24)
    command { open_base64_decoder_page }
  end

  bunjruter_ssh_cracker_button = TkButton.new(rutersMain, button_style) do
    text "SSH Cracker"
    place(x: 150, y: 57)
    command { open_ssh_page }
  end

  bunjruter_ftp_type_scan_button = TkButton.new(rutersMain, button_style) do
    text "Telnet Cracker"
    place(x: 150, y: 90)
    command { open_telnet_page }
  end

  bunjruter_hash_cracker_button = TkButton.new(rutersMain, button_style) do
    text "Hash Cracker"
    place(x: 150, y: 123)
    command { open_hash_cracker_page }
  end

  # Discover Stage

  bunjruter_host_to_ip_button = TkButton.new(rutersMain, button_style) do
    text "Host To IP"
    place(x: 280, y: 24)
    command { open_host2ip_page }
  end

  bunjruter_whois_button = TkButton.new(rutersMain, button_style) do
    text "Whois"
    place(x: 280, y: 57)
    command { open_whois_page }
  end

  bunjruter_port_scanner_button = TkButton.new(rutersMain, button_style) do
    text "Port Scanner"
    place(x: 280, y: 90)
    command { port_scanner_page }
  end

  bunjruter_admin_panel_finder_button = TkButton.new(rutersMain, button_style) do
    text "Banner Grabber"
    place(x: 280, y: 123)
    command {banner_page}
  end

  # Info Stage

  bunjruter_info_button = TkButton.new(rutersMain, button_style) do
    text "Information"
    width 7
    command { open_bunjruter_information_page }
    place(x: 160, y: 330)
  end

  Tk.mainloop
end

if __FILE__ == $0
  main
end
