{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606150332-unstable-2026-06-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "79cfb527d071ce26698d0a8dd4cc4af4150be32c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AW0uvZnc844MbSswnvJnQ+Zcjed3Rw05xkIT3aVbkBg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
