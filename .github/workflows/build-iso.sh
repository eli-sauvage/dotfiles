#chown $(id -u):$(id -g) -R .
nix build .#nixosConfigurations.live.config.system.build.isoImage --extra-experimental-features nix-command --extra-experimental-features flakes
mkdir -p /out
cp result/iso/*.iso /out
