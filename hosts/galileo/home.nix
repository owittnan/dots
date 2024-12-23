{config, pkgs, ...}: {
    home.username = "owittnan";
    home.homeDirectory = "/home/owittnan";
    home.stateVersion = "24.11"; 

    home.packages = with pkgs; [
        awscli2
        direnv
        ffmpeg
        jj
        lazygit
        nmap
        taffybar
        typescript
        python3
        ripgrep
        watch
        yt-dlp
        zig
    ];

    programs.home-manager.enable = true;

    programs.alacritty = {
        enable = true;
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.fish = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake $HOME/.config/nixos#";
            lg = "lazygit";
        };
    };

    programs.nix-index = {
	enable = true;
	enableFishIntegration = true;
    };

    services.taffybar.enable = true;

    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nixos/shared/dots/nvim";
    };
}
