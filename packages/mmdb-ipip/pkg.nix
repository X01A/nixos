{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "133861a06398df4a78875a41fb207f82d6a93578";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dxqaImhAmx8uSVJO03kYg6Ps+rxTYQU5U8IQcPVEq30=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
