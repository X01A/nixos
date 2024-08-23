{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408190310-unstable-2024-08-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b02f7a472fcb8788bc3d253411e8b80b3a07ffa9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-3lwl2ZAIkpSJX+Ac7bfnaNLsvSqwmjHEbnBDwyQKesw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
