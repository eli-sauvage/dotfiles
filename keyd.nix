{...}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            leftmeta = "layer(leftmeta)";
            sleep = "timeout(noop, 2000, sleep)";
          };
          "leftmeta:M" = {
            back = "f1";
            forward = "f2";
            refresh = "f3";
            zoom = "f4";
            scale = "f5";
            brightnessdown = "f6";
            brightnessup = "f7";
            mute = "f8";
            volumedown = "f9";
            volumeup = "f10";
            sleep = "f11";
            backspace = "delete";
            left = "home";
            right = "end";
          };
        };
      };
    };
  };
}
