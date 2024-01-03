{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6438af045fa1faeafa3c6e91b7bb829c11eb03c6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dnanvvv3Kj4ZjMcBzjpvllOM9nBZIVgb/l8qFZ+YYLM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
