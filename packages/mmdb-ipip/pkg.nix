{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cb0111fa98ba20323584b49c5fde3196aea719ef";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wA1q4ZVC8Ours2YAv2agq6DKIedIta6B8JOfoJTxVxc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
