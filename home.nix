{ pkgs, ... }:

{

  # The home-manager manual is at:
  #
  #   https://rycee.gitlab.io/home-manager/release-notes.html
  #
  # Configuration options are documented at:
  #
  #   https://rycee.gitlab.io/home-manager/options.html

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  #
  # You need to change these to match your username and home directory
  # path:
  home.username = "finleyv";
  home.homeDirectory = "/home/finleyv";

  nixpkgs.config.allowUnfree = true;  
  
  xsession.enable = true;

  dconf.settings = {
    "org/gnome/desktop/background" = {
        "picture-uri" = "/home/finleyv/.background-image";
    };
    "org/gnome/desktop/screensaver" = {
        "picture-uri" = "/home/finleyv/.background-image";
    };
  };
  home.file.".background-image".source = "/home/finleyv/.background-image";

  home.packages = with pkgs; [
    # Development/text editors
    vscode
    neovim
    emacs

    python3
    nodejs
    cmake
    rust-analyzer
    rustup

    # Wine
    wine
    winetricks

    # Utils/cli misc.
    pfetch
    btop
    rsync
    rclone
    git
    gh
    unzip
    exa
    
    # Gaming
    steam
    steam-run
    polymc
    discord
    betterdiscordctl

    # School
    teams
    obsidian
    notion

    # Gnome theming and settings
    gnome3.gnome-tweaks
    gnome-themes-extra
    catppuccin-gtk

    # Misc
    blender
    davinci-resolve
    qbittorrent

    # Music
    bitwig-studio
    jack2
    

  ];
  
  nixpkgs.overlays = [(self: super: { discord = super.discord.overrideAttrs (_: { src = builtins.fetchTarball https://discord.com/api/download/stable?platform=linux&format=tar.gz; });})];



  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.services.emacs.Unit = {
    After = [ "graphical-session-pre.target" ];
    PartOf = [ "graphical-session.target" ];
  }; 
 
  # Start emacs server
  services.emacs.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "cd ~/.config/home-manager && bash switch.sh";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.fish = {
    enable = true;
  };

  home = {
    sessionPath = ["/home/finleyv/.emacs.d/bin"];
  };

  programs.git = {
    enable = true;
    userName = "Finley Vickers";
    userEmail = "fvickers05@gmail.com";
  };

}
