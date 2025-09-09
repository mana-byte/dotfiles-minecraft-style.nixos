{
  description = "A very basic flake";

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
      my-machine = nixpkgs.lib.nixosSystem {
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

            home-manager.useUserPackages = true;

            # Define a user with specific packages and groups
            users.users.yourusername = {
              isNormalUser = true;
              extraGroups = ["wheel" "networkmanager" "iwd" "video" "audio"];
              packages = with pkgs; [
                home-manager
                hyprland
                kitty
                neovim
                fastfetch
                brightnessctl
                upower
                quickshell
                tmux
                sox
                iwd

                cmake

                libsForQt5.qt5.qtsvg
                libsForQt5.qt5.qtimageformats
                libsForQt5.qt5.qtmultimedia
                kdePackages.qt5compat

                adwaita-icon-theme
                hicolor-icon-theme
              ];
              xdg.configFile."hypr".source = ./dotfiles/.config/hypr;
              xdg.configFile."kitty".source = ./dotfiles/.config/kitty;
              xdg.configFile."nvim".source = ./dotfiles/.config/nvim;
              xdg.configFile."quickshell".source = ./dotfiles/.config/quickshell;
              xdg.configFile."fastfetch".source = ./dotfiles/.config/fastfetch;
              xdg.configFile."imgborders".source = ./dotfiles/.config/imgborders;

              home.file.".local/share/applications/settings.desktop".source = ./.dotfiles/.local/share/applications/settings.desktop;
              home.file.".tmux.conf".source = ./dotfiles/.tmux.conf;
            };

            services.upower.enable = true;
            services.brightnessctl.enable = true;

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
