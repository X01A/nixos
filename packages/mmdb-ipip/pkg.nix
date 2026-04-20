{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604200317-unstable-2026-04-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8d40c9e69fa66056b58af3ddf48b3965d2415b55";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ZBt5SY8SqYaQf5adozMHs7WM9fWGoFSFx2NX9GjSsZw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
