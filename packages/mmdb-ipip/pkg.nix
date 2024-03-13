{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9a74d7612629a9c35ed824d57d80c98f94e2ade7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-otIWkXTmVAxr95x5frRK0Op/koMsO5Z2C3W13DnTveg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
