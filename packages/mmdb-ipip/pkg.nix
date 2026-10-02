{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609280549-unstable-2026-10-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e9dbd092df70700f14cfe0203757d0c368034423";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VmMkXdNhyFV4gW5MzJWXbUP19eh7aoCm4+41QAcEcIM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
