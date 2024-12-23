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

    programs.fish = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake $HOME/.config/nixos#";
            lg = "lazygit";
        };
    };

#     home.file = {
#         ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix/hosts/copernicus/dots/nvim";
#         ".config/neovide/config.toml".text = ''
#             neovim-bin = "/etc/profiles/per-user/owittnan/bin/nvim"
#         '';
#     };
}
