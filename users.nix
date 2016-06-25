{ config, pkgs, ... }:

{
  users.extraUsers = {
    carl = {
        name = "carl";
        extraGroups =
          [
            "wheel" "disk" "audio" "video"
            "networkmanager" "systemd-journal"
          ];
        isNormalUser = true;
        uid = 1000;
        shell = "/run/current-system/sw/bin/zsh";
    };
  };
}
