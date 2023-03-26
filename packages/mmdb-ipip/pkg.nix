{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cf77c85bc63ae5440eb585b0b705535cf7ddc7ec";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-YqwD9Rgd00YZauwI4b1Izpz7G8eBSkrjrocVyO7SJDk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
