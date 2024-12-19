{config, pkgs, ...}: {
    home.username = "owittnan";
    home.homeDirectory = "/Users/owittnan";
    home.stateVersion = "24.05"; 

    home.packages = with pkgs; [
        awscli2
        ffmpeg
        jj
        lazygit
        nmap
        typescript
        python3
        ripgrep
        watch
        yt-dlp
    ];

    programs.home-manager.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.zsh = {
        enable = true;
        shellAliases = {
            rebuild = "darwin-rebuild switch --flake $HOME/.config/nix";
        };
        initExtra = ''
            [[ ! -f ${./dots/zsh/p10k.zsh} ]] || source ${./dots/zsh/p10k.zsh}
        '';
        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; }
                { name = "zsh-users/zsh-syntax-highlighting"; }
                { name = "romkatv/powerlevel10k"; tags = [ as:theme ]; }
            ];
        };
    };

    programs.fish = {
        enable = true;
        shellAliases = {
            rebuild = "darwin-rebuild switch --flake $HOME/.config/nix";
            lg = "lazygit";
        };
    };

    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix/hosts/copernicus/dots/nvim";
        ".config/neovide/config.toml".text = ''
            neovim-bin = "/etc/profiles/per-user/owittnan/bin/nvim"
        '';
    };
}
