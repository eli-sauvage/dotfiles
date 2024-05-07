FROM nixos/nix

RUN nix-channel --update

RUN nix-env -iA nixpkgs.nodejs_18

USER nix:nix

RUN mkdir -p /home/nix

COPY --chown=nix:nix . .
