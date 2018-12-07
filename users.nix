{ config, pkgs, ... }:

{
  users.extraUsers = {
    carl = {
        name = "carl";
        extraGroups = [
          "wheel" "disk" "audio" "video"
          "networkmanager" "systemd-journal"
          "docker" "vboxusers"
        ];
        isNormalUser = true;
        uid = 1000;
        shell = pkgs.zsh;
    };
  };
}
