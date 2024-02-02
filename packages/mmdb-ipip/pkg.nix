{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9b30a1e6255151ee826c4c0145764a95c9d77a71";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WVsoHtD1wP0ySaeoDtRCBjn3u4JgP5mU0nrieQwiigw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
