{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4a0b673b6fd19127bc741529e1c1c3983a14cf80";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-c4vfko9t3VPUFQNMeM2GOmnGq3RD4rsaz63A2n4vdKo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
