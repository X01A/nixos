{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404290308-unstable-2024-04-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "46718a261eac64492a2c518e2a5dc59a8ed23b99";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-aaYN7Vt2+IJERo0lBN6wOAE6/Zzp/uTEMQBgmrtJb/w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
