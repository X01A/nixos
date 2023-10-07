{ lib, stdenv, fetchFromGitHub, buildGo121Module }:

buildGo121Module rec {
  pname = "kcptun";
  version = "20230811";

  src = fetchFromGitHub {
    owner = "xtaci";
    repo = "kcptun";
    rev = "v${version}";
    sha256 = "sha256-ZuZ0JR5KIdMfzTKk88EFDMhXsE4zpVi8FnmvTTqlwuE=";
  };

  vendorHash = null;

  postInstall = ''
    mv $out/bin/client $out/bin/kcptun-client
    mv $out/bin/server $out/bin/kcptun-server
  '';

  meta = with lib; {
    description = "Stable and secure tunnel with multiplexing and FEC";
    homepage = "https://github.com/xtaci/kcptun";
    license = licenses.mit;
  };
}
