{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "02d0854db5b25c477d140a4033b09f0d2d411ed7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bWdKethqGk1bigNgBi8/NgVjqFCl+TPwm4bUHckL0g0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
