{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605180327-unstable-2026-05-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7494b0c20e062e38dd84cff1b188b8daa91adafb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NdbwHvisn339OseFVq1Zvz40hER3noJ7S03WJ0f1Epg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
