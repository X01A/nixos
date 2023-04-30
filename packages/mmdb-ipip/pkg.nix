{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5c77d2817054e9acbc1c4db85c3e2767b20da70e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6Jcu5LsCdxxFrSOW6SGiTvb8TpG/Y0+SszwNIyPWL4A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
