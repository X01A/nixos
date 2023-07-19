{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "99f3752199f80434b948f9d3471e1da4cf757a5e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uwjZwyEwKeqSqac1MjP4QGj3KGZysTv1XSVk7b3KzX8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
