{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604060314-unstable-2026-04-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "23d37f1252a2cffd46c032b3bb0ca49d896aa60e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-32mWDvzN90C1N2j918EmPnU33nxXc/01GxD4aNKeRuk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
