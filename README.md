# Nix System Configuration

This repository manages system configurations for all of my macOS, nixOS and
Linux machines.

## Structure

This repository is a [flake](https://nixos.wiki/wiki/Flakes). All system
configurations are defined in [flake.nix](./flake.nix). Platorm specific
configurations are found defined in the flake outputs `darwinConfigurations`,
`nixosConfigurations` for macOS and NixOS respectively.

### Overlapping Nix-Darwin and NixOS

Nix-Darwin and NixOS configuratons share as much overlap as possible in the
common module, [./modules/common.nix](./modules/common.nix). Platform specific
modules add onto the common module in
[./modules/darwin/default.nix](./modules/darwin/default.nix) and
[./modules/nixos/default.nix](./modules/nixos/default.nix) for macOS and NixOS
respectively.

### Decoupled Home Manager Configuration

My home-manager configuration is entirely decoupled from NixOS and nix-darwin
configurations. This means that all of its modules are found in
[./modules/home-manager](./modules/home-manager). These modules are imported
into all other configurations in the common module similarly to this:

```nix
{ config, pkgs, ... }: {
  home-manager.users.sarah = import ./home-manager/home.nix;
}
```

This means that [home.nix](./modules/home-manager/home.nix) is fully compatible
as a standalone configuration, managed with the `home-manager` CLI. This allows
close replication of any user config for any linux system running nix. These
configurations are defined in the `homeConfigurations` output.

### User Customization

User "profiles" are specified in [./profiles](./profiles); these modules
configure contextual, identity-specific settings such as TLS certificates or
work vs. personal email addresses. When possible, home-manager functionality is
extracted into [./profiles/home-manager](./profiles/home-manager), as mentioned
previously.

## Installing a Configuraton

### Non-NixOS Prerequisite: Install Nix Package Manager

Install a multi-user Nix install.

## System Bootstrapping

### NixOS

Follow the installation instructions, then run

```bash
sudo nixos-install --flake github:sarahhodne/nix-system#<hostname>
```

### Darwin/Linux

Clone this repository into `~/.nixpkgs` with

```bash
git clone https://github.com/sarahhodne/nix-system ~/.nixpkgs
```

You can bootstrap a new nix-darwin system using

```bash
nix develop -c sysdo disksetup && sysdo build --darwin [host] && ./result/activate-user && ./result/activate
```

or a home-manager configuration using

```bash
nix develop -c sysdo build --home-manager [host] && ./result/activate
```

## `sysdo` CLI

The `sysdo` utility is a Python script that wraps `nix`, `darwin-rebuild`,
`nixos-rebuild`, and `home-manager` commands to provide a consistent interface
across multiple platforms. It has some dependencies which are defined in the
`devShell` flake output. Documentation for this tool is found in
[sysdo.md](./docs/sysdo.md).

# Licence

This repository uses the MIT licence, see the LICENCE file for details.

The repository was originally based on
[kclejeune/system](https://github.com/kclejeune/system), which had the following copyright and permission notice:

```
Copyright (c) 2020 Kennan LeJeune

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
