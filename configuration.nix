# configuration.nix(5) man page
# nixos-help

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  networking.hostName = "lumihiutale"; # 
  # networking.wireless.enable = true;  # 
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  console.keyMap = "fi";
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  users.users.reintse = {
    isNormalUser = true;
    description = "Leevi Nikola";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      nerd-fonts.mononoki
      mononoki
      overpass
      nerd-fonts.overpass
      proggyfonts
      dejavu_fonts
      nerd-fonts.dejavu-sans-mono
];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  programs.waybar.enable = true;
  environment.variables.EDITOR = "micro";
  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  #   nix search wget
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    swaybg
    tofi
    fuzzel
    rofi
    killall
    micro
    neovim
    wget
    curl
    git
    fastfetch
    hyfetch
    kitty
    nemo-with-extensions
    nemo-fileroller
    grim
    slurp
    wl-clipboard
    mako
    librewolf    
    dconf
    dconf-editor
    networkmanagerapplet
    eww
    vesktop
    prismlauncher
    clonehero
    yarg
    spotify
    pwvucontrol
    volumeicon
    waybar
    nautilus
    
      
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # man configuration.nix & https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";

}
