FROM nixos/nix

RUN nix-channel --update

RUN nix-build -A pythonFull 'nodejs_18'
