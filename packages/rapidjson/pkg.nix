{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2024-03-07";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "68afb49287fe1837ff138c3e7f77d25514ae2749";
    fetchSubmodules = true;
    sha256 = "sha256-avyPWbGsLixqPznOZE/tqHN9ccTWjnVns5Spqj5hUp8=";
  });

  nativeBuildInputs = [ cmake ];
}
