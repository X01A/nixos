{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7d95041a87e0ff9dbb3797b1411042750628b179";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SGVhyLVeHjSdYKitZpVyZt7Yt1hD47npKo9GwZlfHXA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
