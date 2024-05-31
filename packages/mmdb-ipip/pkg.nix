{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405270309-unstable-2024-05-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "88e548d14e983869fdaf1c06a57d8ecdae2cbe12";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-HwI4SVfcFNJ9oOqc7kZOEw9nPaTqZUFltHlFduS0z1s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
