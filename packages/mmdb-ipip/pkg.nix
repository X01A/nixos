{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c8343ca6dac3f0dcde89d2b51f2917e865f76743";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8DOdaa1Bee8pC7OKI7DTrElVBBms1NmjCNariUHZdYQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
