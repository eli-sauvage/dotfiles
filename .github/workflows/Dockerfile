FROM nixos/nix

RUN nix-channel --update

RUN nix-env -iA nixpkgs.nodejs_18

RUN useradd nix -d /home/nix && mkdir -p /home/nix

COPY --chown=nix:nix . .

USER nix:nix
