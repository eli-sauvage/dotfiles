FROM nixos/nix

RUN nix-channel --update

RUN nix-env -iA nixpkgs.nodejs_18

COPY --chown=0:0 . .
