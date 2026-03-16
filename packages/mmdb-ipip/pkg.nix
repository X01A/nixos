{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603160310-unstable-2026-03-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "94778a17a15e30560c615849d2752895ea987a88";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-104vcfKchpKGVE+whQscdjW0OJacQ4fQcbGn2ru/hEs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
