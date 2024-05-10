{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405060310-unstable-2024-05-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "665dc6bd7f295a19f15c2ef68eb2a5f2dc322b30";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0Nrg69FR71N/xPRFnrZX48ikmVFrU7B+Kl0KRniA5RA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
