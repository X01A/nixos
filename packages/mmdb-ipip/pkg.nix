{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505120311-unstable-2025-05-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "95ee51908afea53b95f8e66a09574f6684ed65ee";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6HmSJTOP55IjAnWd3zBTralosR7h8XLt7l9uwHtad6Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
