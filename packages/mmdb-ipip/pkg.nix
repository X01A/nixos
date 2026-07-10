{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607060410-unstable-2026-07-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5f87cded1fb54ea8c90f1a38b8cb0e11a8569db6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Yps0asrOT5hJwl7gAjBHclkBYoasISkioHxvKtKwj4c=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
