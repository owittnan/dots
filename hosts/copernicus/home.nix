{config, pkgs, ...}: {
    home.username = "owittnan";
    home.homeDirectory = "/Users/owittnan";
    home.stateVersion = "24.05"; 

    home.packages = with pkgs; [
        awscli2
        cachix
        direnv
        ffmpeg
        jj
        lazygit
        nmap
        typescript
        python3
        ripgrep
        stats
        watch
        yt-dlp
    ];

    programs.home-manager.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.helix = {
        enable = true;
        settings = {
            theme = "catppuccin_mocha";
        };
    };

    programs.fish = {
        enable = true;
        shellAliases = {
            rebuild = "darwin-rebuild switch --flake $HOME/.config/nix";
            lg = "lazygit";
            vim = "hx";
        };
    };

    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix/shared/dots/nvim";
        ".config/neovide/config.toml".text = ''
            neovim-bin = "/etc/profiles/per-user/owittnan/bin/nvim"
        '';
    };
}
