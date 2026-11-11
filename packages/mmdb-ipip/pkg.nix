{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611090638-unstable-2026-11-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2c1c0b70bad230d61c89a8e7218cde6163d1946d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-HVQhcWzAWxDmwEoUPdpVg/2ie/SDHCiznSHR3cqymY8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
