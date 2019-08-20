# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "louis-xps13"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_GB.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Asia/Hong_Kong";

  ## PACKAGES

  system.autoUpgrade.enable = true;

  environment.systemPackages = with pkgs; [
    # Archive Managers
    p7zip
    unzip
    zip
    # Development
    android-studio
    cargo
    git
    go
    neovim
    neovim-qt
    leiningen
    nodejs
    openjdk
    ruby
    php
    python
    python3
    tmux
    # Internet
    chromium
    google-chrome
    qbittorrent
    # Languages
    fcitx
    fcitx-configtool
    fcitx-engines.mozc
    fcitx-engines.rime
    # Media
    audacity
    blender
    gimp
    inkscape
    mpv
    spotify
    steam
    # Themes
    adapta-gtk-theme
    adapta-kde-theme
    # Tools
    appimage-run
    flatpak
    xclip
    xdotool
    xsel
    youtube-dl
    # Social
    discord
    hexchat
    # Virtualisation
    docker
    docker-compose
    vagrant
    # Others
    keepass
    libinput-gestures
    zsh
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  programs.zsh.enable = true;

  fonts.fonts = with pkgs; [
    inconsolata
    liberation_ttf
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    roboto
  ];

  # List services that you want to enable:

  services = {
    # Enable the OpenSSH daemon.
    # openssh.enable = true;
    # Enable CUPS to print documents.
    gnome3.gnome-keyring.enable = true;
    printing.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable libva and vaapi
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver # only available starting nixos-19.03 or the current nixos-unstable
    ];
  };

  # Support 32-bit for steam
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "intel" ];
    # layout = "us";
    xkbOptions = "ctrl:nocaps";
    displayManager.gdm.enable = true;
    # Desktop Environment
    desktopManager = {
      gnome3.enable = true;
      xterm.enable = false;
    };
    # Enable touchpad support.
    libinput = {
      enable = true;
      horizontalScrolling = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
      tapping = true;
    };
  };

  environment.gnome3.excludePackages = with pkgs.gnome3; [
    epiphany
    evolution
    gnome-maps
    gnome-music
    gnome-photos
    gedit
    totem
    gnome-calendar
    gnome-weather
    accerciser
    gnome-software
  ];

  # Input Method
  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ mozc rime ];
  };

  virtualisation = {
    virtualbox.host.enable = true;
    docker.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.louis = {
    isNormalUser = true;
    home = "/home/louis";
    createHome = true;
    description = "Louis Chan";
    extraGroups = [ "wheel" "networkmanager" "vboxusers" "docker" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
