FROM nixos/nix

RUN nix-channel --update

RUN nix-env -iA nixpkgs.nodejs_18

USER 1000

COPY --chown=1000:1000 . .
