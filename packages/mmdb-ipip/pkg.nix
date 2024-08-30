{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408260311-unstable-2024-08-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "95ee8cda46e1858a3933cb271943f0b7af4791b0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SsZweKO1Ds7cV5BVR1XPub4cyGbz94U9BZ3/hh62A1o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
