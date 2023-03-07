{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9193b9fbfeb9e92e7e1e720463be5167f19165ef";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-l0OkicLdXv/DF9i54zLP/oNzS8eDSbbgybsUAyOZcHQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
