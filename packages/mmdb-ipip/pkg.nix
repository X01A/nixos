{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605180327-unstable-2026-05-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "af72a237de317e043b6c753ef95cf8bbe95aa373";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VnryeYI1jv41smrv3C0s3mimUFaVZJuTres/vNg/TQg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
