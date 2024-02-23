{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e15b303be7654c02fd4faec26052ca5dbc046480";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8NYP73T1WmA1q3WFdMmKhoRIh6mHqPrSkhKCqcoQICk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
