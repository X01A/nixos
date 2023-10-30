{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "77f97a06673b677f96ba3fe26a84d90e2d35f5af";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oyWGH0aHSkaSxLZcEun8ju97Bvn2eCDvbY3lQdc+iks=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
