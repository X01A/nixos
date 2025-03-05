{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503030311-unstable-2025-03-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a7fa0f463cb352c45b3c08586f8af1d45752e6cb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+j9k4upbVlSV2PHsgRWAe0B4ZTXCErdGvOtx0+wbV5E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
