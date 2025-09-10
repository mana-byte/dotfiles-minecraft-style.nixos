{
  description = "A nix flake to install dotfiles-minecraft-style on nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: {
    nixosConfigurations = {
      minecraft = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({
            config,
            pkgs,
            ...
          }: {
            imports = [
              /etc/nixos/configuration.nix
              home-manager.nixosModules.home-manager
            ];

            # enable flakes
            nix.settings.experimental-features = ["nix-command" "flakes"];

            home-manager.useUserPackages = true;

            # Define a user with specific packages and groups
            users.users.mana = {
              isNormalUser = true;
              extraGroups = ["wheel" "networkmanager" "iwd" "video" "audio"];

              # No password for login
              hashedPassword = "";

              packages = with pkgs; [
                xdg-desktop-portal
                home-manager
                aquamarine
                dconf
                kitty
                fastfetch
                brightnessctl
                upower
                quickshell
                tmux
                sox

                cmake

                # only for pactl cmd
                pulseaudio

                libsForQt5.qt5.qtsvg
                libsForQt5.qt5.qtimageformats
                libsForQt5.qt5.qtmultimedia
                kdePackages.qt5compat

                adwaita-icon-theme
                hicolor-icon-theme
                starship
                hyprcursor

                libnotify
                dunst

                # apps for full features
                discord
                nautilus
                brave
              ];
            };
            environment.systemPackages = with pkgs; [
              neovim
            ];

            home-manager.users.mana = {
              xdg.configFile."hypr".source = ./dotfiles/.config/hypr;
              xdg.configFile."kitty".source = ./dotfiles/.config/kitty;
              xdg.configFile."nvim".source = ./dotfiles/.config/nvim;
              xdg.configFile."quickshell".source = ./dotfiles/.config/quickshell;
              xdg.configFile."fastfetch".source = ./dotfiles/.config/fastfetch;
              xdg.configFile."imgborders".source = ./dotfiles/.config/imgborders;

              home.file.".local/share/applications/settings.desktop".source = ./dotfiles/.local/share/applications/settings.desktop;
              home.file.".tmux.conf".source = ./dotfiles/.tmux.conf;
              home.stateVersion = "23.05";
            };

            services.upower.enable = true;
            networking.wireless.iwd.enable = true;
            networking.networkmanager.wifi.backend = "iwd";

            programs.hyprland = {
              enable = true;
              xwayland.enable = true;
            };
            # audio
            security.rtkit.enable = true;
            services.pipewire = {
              enable = true; # if not already enabled
              alsa.enable = true;
              alsa.support32Bit = true;
              pulse.enable = true;
              # If you want to use JACK applications, uncomment this
              jack.enable = true;
            };
          })
        ];
        specialArgs = {inherit self;};
      };
    };
  };
}
