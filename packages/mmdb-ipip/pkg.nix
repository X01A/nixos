{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412020310-unstable-2024-12-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1b25fd7f4a14ec20908f752e82fa506787733437";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yiERn3hrJZLqAt5fbH5cFzoji5Ch6vT9Sjt2oS5FWsA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
