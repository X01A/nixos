{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f5c1369275038a5f665b7664baf830bda7f6aecc";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TCt02bsdZQEAB9lmBWDK6zEUyL5RPeV78ICAqTR6sMQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
