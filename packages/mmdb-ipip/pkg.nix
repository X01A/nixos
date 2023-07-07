{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a1e0c7e12524d051752a9db75fea9df7e856164b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tdEDFEuf1KmgQbjWyxyNegWXuU9VUp2zxAIABx27y0c=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
