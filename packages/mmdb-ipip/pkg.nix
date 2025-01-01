{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412300310-unstable-2024-12-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7c7f31043f6917bfaa32824e9444743bff45cdcf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9bEKepmQJKw0GY5XdOZOnDiNVVIImVMhOHIl2IJ2Wz8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
