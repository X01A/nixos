{ source, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "yacd";
  version = "0.3.8";
  src = fetchurl {
    url = "https://github.com/haishanh/yacd/releases/download/v${version}/yacd.tar.xz";
    sha256 = "sha256-1dfs3pGnCKeThhFnU+MqWfMsjLjuyA3tVsOrlOURulA=";
  };

  installPhase = ''
    mkdir $out
    tar -xf $src --strip-components=1 -C $out
  '';
}
