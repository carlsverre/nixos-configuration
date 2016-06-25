Check out this repo at /etc/nixos/configuration, then update configuration.nix
accordingly.

```
/etc/nixos $ ls -la
total 20K
drwxr-xr-x  3 root 4.0K Jun 25 12:11 .
drwxr-xr-x 21 root 4.0K Jun 25 12:12 ..
drwxr-xr-x  3 carl 4.0K Jun 25 12:12 configuration
-rw-r--r--  1 root  287 Jun 25 12:11 configuration.nix
-rw-r--r--  1 root  839 Jun 23 04:24 hardware-configuration.nix

/etc/nixos $ cat configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./configuration/nix.nix
      ...include other files here...
    ];
}
```
