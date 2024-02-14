{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ec2ae498ae448e95871c92ac8017348937459e61";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vhMiHCf9ujJu1w5Mw1MznfIYkvamyn3AFcqDvIvB784=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
