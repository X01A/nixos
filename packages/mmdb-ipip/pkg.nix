{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d51f003be738d58ab4e586917139b1feecc9d241";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bpR84x9uPURT+APW88jI2Zb+DdMJ4sv76s/Jja4rcYg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
