{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409090311-unstable-2024-09-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8a6f63759fb83c418be3cb6a76cd197f3f7f5ba8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-MXRMWoxCoWP0YuQxfK4NnpoNvX6bIF/l64rCUEuIAU8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
