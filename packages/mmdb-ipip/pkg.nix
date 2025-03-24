{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503240312-unstable-2025-03-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "67bf44bbca9b01e2fee9c0b91aa5c4f79d2627d6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fKzSDMHWwYiplZZoc5oqlAakHfGnsqI0cy/ndza5zfs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
