{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506020312-unstable-2025-06-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "df7aa8959ba9394b8f36225229d70b4decf245e3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zfZQ2Sqi6oSJCDtrTI8e9eaVr92rDV1Vk6VFYRPOfFg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
