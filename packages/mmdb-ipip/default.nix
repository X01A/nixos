{ source, stdenv }:

stdenv.mkDerivation rec {
  inherit (source) src pname version;

  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
