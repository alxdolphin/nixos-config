{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.adalton = {
    isNormalUser = true;
    home = "/home/adalton";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$i5Q3gCzYv0xdOPkG$yhR0wV6LQGqJXMd4fDk7MBwsc6hKHUZhS7vicvpK7a.Nc7M94bLQvCgcjrjGLHguc8eM1TFggomUNDHZI.7Lm.";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1g0TSCyhvp5xQ728lNNmtaHbod+OpexqxWtogPMkZIsOq4jVGM7Bk5MiERmnfr2/nPbtOcvt08mY8WrFvckN4WJYhRtHmlnjU+vMk5hb1g0JtY1P4UgDzm4idD7R7xWTH7NydLOXYPB1PLiGtCJejqyuaxKyEK9lcKZhP2RctPR2T3nz/21kQ0/9sfKIeWDU3c1bcdOSleb4MS6R9/ikwiuf6WAfct/UYh5cly655c3izQIt7WhfAvlYJQmLYVJmXYRvL6dpn7EcC0jZMZy5aExZ0Lk8tWhtte1mA0MB4POMfLGPpuSlm9esLGJ27HHnqYVrEBCZfAQ9YtJ2Yn7qwp8PIxKg9EayXw3+hNRZ027srVZN2bO0LEhggTnNoMdda+1oGZirY0z6xF6nyGQ0P8r/jn9YcwSMbQ6Fsooo+kg95gWjrJe5aHAmKjpkclUOpWVQKORjL0PsTxesXngJccka2kt3hFA7DoHhTQH15BLmAXg5z4yRkje9csNDetb+rDeMKuZeKSZDWnxvhJ9QNwGtRvJuEfiLSzWbBEyEREDLToGZynKIfzEXvW01urd4WvGF71lc8XNX+zuJqqEhb9owORsCrNefIHwSizcQps/48hWrh8jq6AxZvUtqmoWTfMmtMpGuIC5JMxTR3Gx8OGaaDpgfQY7+FxdaGqtzrAQ== adalton@AD-MBP"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
