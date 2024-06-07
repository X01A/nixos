{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406030309-unstable-2024-06-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2c3239c2181e762b822bf8d89c0d77d25ed46156";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-j0BDpz5+NxGzE2hx3UPHk3dLM4aXttk5Um6hUkgFiiM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
