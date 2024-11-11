{
  lib,
  pkgs,
}:
with pkgs;
  python3Packages.buildPythonApplication rec {
    pname = "bottles-unwrapped";
    version = "51.15";

    src = fetchFromGitHub {
      owner = "bottlesdevs";
      repo = "bottles";
      rev = version;
      hash = "sha256-HjGAeIh9s7xWBy35Oj66tCtgKCd/DpHg1sMPsdjWKDs=";
    };

    patches = [./vulkan_icd.patch];

    # https://github.com/bottlesdevs/Bottles/wiki/Packaging
    nativeBuildInputs = [
      blueprint-compiler
      meson
      ninja
      pkg-config
      wrapGAppsHook4
      gtk4 # gtk4-update-icon-cache
      appstream-glib
      desktop-file-utils
    ];

    buildInputs = [
      librsvg
      gtk4
      gtksourceview5
      libadwaita
    ];

    propagatedBuildInputs = with python3Packages;
      [
        pathvalidate
        pycurl
        pyyaml
        requests
        pygobject3
        patool
        markdown
        fvs
        pefile
        urllib3
        chardet
        certifi
        idna
        orjson
        icoextract
      ]
      ++ [
        cabextract
        p7zip
        xorg.xdpyinfo
        imagemagick
        vkbasalt-cli

        gamescope
        mangohud
        vmtouch

        # Undocumented (subprocess.Popen())
        lsb-release
        pciutils
        procps
      ];

    format = "other";
    dontWrapGApps = true; # prevent double wrapping

    preFixup = ''
      makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
    '';

    passthru.updateScript = lib.gitUpdater {};

    meta = with lib; {
      description = "Easy-to-use wineprefix manager";
      homepage = "https://usebottles.com/";
      downloadPage = "https://github.com/bottlesdevs/Bottles/releases";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [
        psydvl
        shamilton
      ];
      platforms = platforms.linux;
      mainProgram = "bottles";
    };
  }
