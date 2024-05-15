{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405130309-unstable-2024-05-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6c1202081c4d3ced7088d9d0757dc187c6854e8b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yAqiKbp9nIwetbCmfLutqwD4+oMQvjNqFe0YzCHff1s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
