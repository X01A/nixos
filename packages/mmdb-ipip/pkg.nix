{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "02f4b65876fb700380da1e83c7f0bdd478e7dd07";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TfJcU+5B/gRaEFm2lCWUX4ZvVXNPbdKU30geVeETtL8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
