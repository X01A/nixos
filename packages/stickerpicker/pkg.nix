{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "unstable-2022-11-15";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "f59406a47a6778cd402e656ffb64f667335f665a";
    sha256 = "sha256-5Kbok9vJIlOti+ikpJXv2skdADhQQTjX5mVmBTM0wGU=";
  };

  propagatedBuildInputs = with python3Packages; [
    aiohttp
    yarl
    pillow
    telethon
    cryptg
    python-magic
          pkgs.cacert
  ];

  doCheck = false;
}
