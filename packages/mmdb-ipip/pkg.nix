{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4daad99ce5de1e41825cf5682a2d62774a036604";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5sm+o9wZnYv/Ml0B3//TwViVdymIrNomu2bthAZHeQY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
