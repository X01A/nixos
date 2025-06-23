{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506230312-unstable-2025-06-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f21fe427fb58abdc8d4517949fe861eef0ca2ef1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Uem/VUKPNLp9nPMT3QXTfe3fsiJ09KovD1pduiPmWVU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
