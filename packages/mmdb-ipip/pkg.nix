{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bf049baac6f97db9f3a7375fc3f554a3585088c6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ZA1VpIyWVT36QN42ioeIRees+Bf7uTo0r+wuI10mIwk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
