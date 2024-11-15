{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411110312-unstable-2024-11-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "51c63f58009a62c1c845c54ed388dc0caf6051e7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KjOX4WwnXiLc61DXEqb9iw8v5PFY5j8/R6ndk9H5mZ0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
