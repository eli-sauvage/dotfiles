{
  inputs,
  ...
}:{
  home-manager.users.elicolh.imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./home.nix 
  ];
}
