{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405130309-unstable-2024-05-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "99b1d186c74bd842b7bcb150dab615dd1895c91b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fx6z52KKXXA7ylHEwOj9ZEpVWno/Fj4+Fr370eXaujo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
