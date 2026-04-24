{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604200317-unstable-2026-04-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "93e43159a4325d07eef2c4d23afe65cbf2fe4625";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SgfhvCJFSzRqwj61dlbgN2hcCAkXesu70iL76DSPmss=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
