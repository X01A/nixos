{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b5f80d414b8bb11d99ae4b4c6235b7d7b6c584fd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-v1P90w+ttedz2v2S8/P0AfPdd19RWEInoo690IYC8ww=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
