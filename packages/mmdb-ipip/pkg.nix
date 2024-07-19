{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407150311-unstable-2024-07-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "de368104f367074c819002b97e609473863f35b2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IG/n3chXdzOZBzfI+t3YNOlmH0c8DqyNTmIKu6hC37I=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
