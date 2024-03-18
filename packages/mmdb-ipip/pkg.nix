{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a67395ac65e24b4732a23bc1f998fc0b89cf27e9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BjKO4K5yAeq2qas/Dtbq36fP7af4db6MAo5K36eM2G8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
