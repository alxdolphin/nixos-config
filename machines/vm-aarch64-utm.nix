{ config, pkgs, modulesPath, ... }: {
  imports = [
    ./hardware/vm-aarch64-utm.nix
    ./vm-shared.nix
  ];

  # Interface is this on my M1
  networking.interfaces.enp0s10.useDHCP = true;

  # Qemu
  services.spice-vdagentd.enable = true;

  # For now, we need this since hardware acceleration does not work.
  environment.variables.LIBGL_ALWAYS_SOFTWARE = "1";

  # Lots of stuff that uses aarch64 that claims doesn't work, but actually works.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # Enable flatpak. I don't use any flatpak apps but I do sometimes
  # test them so I keep this enabled.
  services.flatpak.enable = true;

  # Required for Flatpak
  xdg.portal = {
    enable = true;
    # Add any additional portal configurations if needed
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Disable the firewall since we're in a VM and we want to make it
}
