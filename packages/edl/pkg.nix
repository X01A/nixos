{ fetchFromGitHub, python3 }:

let
  usb = python3.pkgs.buildPythonPackage rec {
    pname = "usb";
    version = "0.0.83.dev0";

    src = python3.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "sha256-pFn1j83yJ2EfTwjSMnNTB+klhUXwbITAC9tCMLauKBI=";
    };

    doCheck = false;
  };
in
python3.pkgs.buildPythonApplication rec {
  pname = "edl";
  version = "unstable-2023-04-08";
  src = fetchFromGitHub ({
    owner = "bkerler";
    repo = "edl";
    rev = "38b567136360a865998ecb71e79eb045bc01db64";
    fetchSubmodules = true;
    sha256 = "sha256-fDvS+I4OiWwStPLx6WzqSef4fsmXx+mfHbYNdsLgW2Q=";
  });

  propagatedBuildInputs = with python3.pkgs; [
    lxml
    pyusb
    pylzma
    colorama
    docopt
    pyserial
    pycryptodome
    usb
    keystone-engine
    capstone
  ];

  outputs = [ "out" "udev" ];

  doCheck = false;
  preInstall = ''
    mkdir -p $udev/lib/udev/rules.d
    cp Drivers/51-edl.rules $udev/lib/udev/rules.d
    cp Drivers/50-android.rules $udev/lib/udev/rules.d
  '';
}
