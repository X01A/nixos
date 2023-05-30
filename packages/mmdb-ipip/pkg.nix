{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "da91c9195eea0d56c2bbec035a3746aca42e0c4c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TPAKtWsh+iS4Wu1KuLpsEgFsL5gFYZxLmb02bP9zExw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
