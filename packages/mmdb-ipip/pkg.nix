{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2bde4a436a8e827551e9857da1a7ffa79d7cb658";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-x3ELeNw52WqZl2Cm31Yt4HTBPT0Evq3gk8VWHdJLv20=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
