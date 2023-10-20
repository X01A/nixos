{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "84a44dc5db5e24a006e64fd77b885da68e1f4059";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IbsEbvDAdV6Gxws3tn70KCapcbShj+VDZY6z40ACK/w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
