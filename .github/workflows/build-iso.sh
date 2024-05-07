nix-build .#nixosConfigurations.live.config.system.build.isoImage --extra-experimental-features nix-command --extra-experimental-features flakes
