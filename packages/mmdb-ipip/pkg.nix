{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506090312-unstable-2025-06-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4956c115bf4f927f6e90c6d9a0839b550c7fc89e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CBRs5ciIXX+817eEJRS4vqvuWc25kCiE+K/nKOWpEm8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
