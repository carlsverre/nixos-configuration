Clone this repo at /etc/nixos/configuration along with other configs below.

```
/etc/nixos $ ls -la
total 20K
drwxr-xr-x  3 root 4.0K Jun 25 12:11 .
drwxr-xr-x 21 root 4.0K Jun 25 12:12 ..
drwxr-xr-x  3 carl 4.0K Jun 25 12:12 configuration
-rw-r--r--  1 root  287 Jun 25 12:11 configuration.nix
-rw-r--r--  1 root  839 Jun 23 04:24 hardware-configuration.nix
drwxr-xr-x  9 carl 4.0K Jun 27 21:15 nixpkgs

/etc/nixos $ cat configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./configuration/nix.nix
      ...include other files from ./configuration here...
    ];
}

/etc/nixos $ cd nixpkgs
/etc/nixos/nixpkgs $ git remote -v
carlsverre  git@github.com:carlsverre/nixpkgs (fetch)
carlsverre  git@github.com:carlsverre/nixpkgs (push)
channels    git@github.com:nixos/nixpkgs-channels (fetch)
channels    git@github.com:nixos/nixpkgs-channels (push)
origin  git@github.com:nixos/nixpkgs (fetch)
origin  git@github.com:nixos/nixpkgs (push)

/etc/nixos/nixpkgs $ git status
On branch nixos-unstable
Your branch is up-to-date with 'channels/nixos-unstable'.
nothing to commit, working directory clean
```
