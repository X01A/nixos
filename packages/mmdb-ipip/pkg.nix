{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609070306-unstable-2026-09-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d4a53a0ee7b09b6a1f16ed2bcea4b8021dcf13da";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wyGqlEC80EXXuNP4alPLuQMIxCLoZ3vk7iax3MuantA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
