FROM nixos/nix

WORKDIR dotfiles

RUN nix-channel --update

RUN nix-env -iA nixpkgs.nodejs_18

COPY --chown=0:0 . .
