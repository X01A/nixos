{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9e376fc3860400c671e9c41a1d66f6bbfb57a678";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1Lx2zfJTfBXjEddwRi9rIkn9lGO4DXxjx5Ac+g2Q8ho=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
