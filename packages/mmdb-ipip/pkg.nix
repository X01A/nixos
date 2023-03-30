{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "62dc603a3e3fbced013e7c7901b78b355bb522df";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Xun11FVX8mksKUpZEIxZL4EF/jw8zwTWRC+OQcseo6s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
