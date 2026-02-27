{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602230308-unstable-2026-02-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b52a12646de4d47d8a19eef74795f657e7137995";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-F7pJiuJe2rbmBAEgZaaOOgxs/xGcEtJU/3Mcj05VzZo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
