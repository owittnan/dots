{config, pkgs, ...}: {
    home.username = "owittnan";
    home.homeDirectory = "/Users/owittnan";
    home.stateVersion = "24.05"; 

    home.packages = [
        pkgs.ffmpeg
        pkgs.jj
        pkgs.nmap
        pkgs.typescript
        pkgs.python3
        pkgs.ripgrep
        pkgs.watch
        pkgs.yt-dlp
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

    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix/hosts/copernicus/dots/nvim";
    };
}
