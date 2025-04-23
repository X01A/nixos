{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504210313-unstable-2025-04-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e59fa686096d5647a1725e80e34b72475e9a521f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4a2hZfUWaPhmIo4Li3jVmby6j8g1aliOuJVXLX/pLMI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
