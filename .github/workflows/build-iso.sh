#chown $(id -u):$(id -g) -R .
#nix build .#nixosConfigurations.live.config.system.build.isoImage --extra-experimental-features nix-command --extra-experimental-features flakes
nix build .#iso --extra-experimental-features nix-command --extra-experimental-features flakes
mkdir -p /out
ls result -Rl
cp result/iso/*.iso /out
