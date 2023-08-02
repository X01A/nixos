{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a6a803a2e4a20fd34fc67e407a243525b4e05ad7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-K57mUMf1KunGB8kFW3Llf5qghtkqVCjWnHJyO8mgbx4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
