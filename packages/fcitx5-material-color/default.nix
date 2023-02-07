{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "fcitx5-material-color";
  version = "0.2.1";
  src = fetchFromGitHub ({
    owner = "hosxy";
    repo = "Fcitx5-Material-Color";
    rev = "0.2.1";
    fetchSubmodules = true;
    sha256 = "sha256-i9JHIJ+cHLTBZUNzj9Ujl3LIdkCllTWpO1Ta4OT1LTc=";
  });

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm644 arrow.png radio.png -t $out/share/${pname}/
    for _variant in black blue brown deepPurple indigo orange pink red sakuraPink teal; do
      _variant_name=Material-Color-''${_variant^}
      mkdir -p $out/share/fcitx5/themes/$_variant_name/
      ln -s $out/share/${pname}/arrow.png $out/share/fcitx5/themes/$_variant_name/
      ln -s $out/share/${pname}/radio.png $out/share/fcitx5/themes/$_variant_name/
      install -Dm644 theme-$_variant.conf $out/share/fcitx5/themes/$_variant_name/theme.conf
      sed -i "s/^Name=.*/Name=$_variant_name/" $out/share/fcitx5/themes/$_variant_name/theme.conf
    done
  '';

  meta = with lib; {
    homepage = "https://github.com/hosxy/Fcitx5-Material-Color";
    description = "Material color theme for fcitx5";
    license = licenses.asl20;
  };
}
