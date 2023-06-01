{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fac94c018fc63d75c8e3e26c2c2a8667c7bb5946";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-3sQ5KSlt52Yr8mGfE8kEfYIBBaZdGREfmWVoiUIo98Q=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
