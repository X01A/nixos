{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "958ebe52a9a742bed6f1f4085e1489191a4a4aae";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AfEKSpya2oKb8U+mmo6jVavMUmpiT8S3zO/e0mYTjbU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
