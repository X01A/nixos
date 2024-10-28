{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410280312-unstable-2024-10-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "452a9d9170ddf058429cd9a7b141b5330f85c270";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GiZWwczW1DqCAtTPbaK47PrePvje27zPU3IU4gyW6hs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
