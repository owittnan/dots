{ pkgs, ... }: {
    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # nix.package = pkgs.nix;
    

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    nix.settings.trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    nix.settings.substituters = [ "https://cache.iog.io" "https://nix-node.cachix.org" ];
    nix.settings.trusted-users = [ "owittnan" ];
    
    nix.registry."node".to = {
        type = "github";
        owner = "andyrichardson";
        repo = "nix-node";
    };

    # Create /etc/zshrc that loads the nix-darwin environment.
    # programs.zsh.enable = true;  # default shell on catalina
    programs.fish.enable = true;
    
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;
    
    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
    
    users.users.owittnan = {
        name = "owittnan";
        home = "/Users/owittnan";
        shell = pkgs.zsh;
    };

    home-manager.backupFileExtension = "bak";
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.owittnan = import ./home.nix;

    homebrew = {
        enable = true;
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
    
        casks = [
            "apple-juice"
            "neovide"
            "openscad@snapshot"
            "raycast"
            "spaceman"
            "stremio"
            "tailscale"
            "vial"
        ];
    };
}
