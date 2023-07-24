{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fbbbc47f5b42f438a7f9f9582176c1adc5bee0b4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-lvL7IlZ/xe3gTJhX1G/EoGlLh3ETyDlzvpTakbBFg8M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
