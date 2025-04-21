{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504210313-unstable-2025-04-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "71963126df0f124c85cbe68225b6fd76453fd470";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bjedAmAitR5V3NOxZ5bjII95Md9uNBNeljDztdPHP6U=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
