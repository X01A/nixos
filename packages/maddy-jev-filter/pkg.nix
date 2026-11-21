{
  lib,
  stdenv,
  fetchFromGitHub,
  ldc,
  python3,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "maddy-jev-filter";
  version = "0-unstable-2026-11-10";

  src = fetchFromGitHub {
    owner = "lesderid";
    repo = "maddy-jev-filter";
    rev = "8d3dc13762d2b060577aa3fd2ef7258a2a798c90";
    hash = "sha256-jjB2h50g7fvi1GU0SD9l6e25CTGBmuNVEwwTeWXKraA=";
  };

  nativeBuildInputs = [ ldc ];
  nativeCheckInputs = [ python3 ];

  # The filter names the commit it came from in every header it adds, by
  # reading VERSION from the directory the source tree had at compile time
  # and falling back to `git describe` there. The build directory is gone at
  # runtime, so aim the lookup at the installed tree, where installPhase
  # writes the same VERSION file.
  postPatch = ''
    substituteInPlace jevfilter/util.d --replace-fail \
      'auto root = dirName(dirName(__FILE_FULL_PATH__));' \
      'auto root = "${placeholder "out"}/share/maddy-jev-filter";'
  '';

  buildPhase = ''
    runHook preBuild
    ldc2 -O -release -I. -od="$TMPDIR/obj" -of=maddy-jev-filter maddy-jev-filter.d jevfilter/*.d
    runHook postBuild
  '';

  doCheck = true;
  checkPhase = ''
    runHook preCheck
    # run.sh runs the unit tests through rdmd, which needs a matching dmd;
    # ldc2 runs them itself with -run.
    substituteInPlace test/run.sh --replace-fail \
      'rdmd -unittest --main -I.' 'ldc2 -unittest --main -I. -run'
    FILTER=$PWD/maddy-jev-filter bash test/run.sh
    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 maddy-jev-filter $out/bin/maddy-jev-filter
    install -Dm644 jev-filter.example.json $out/share/maddy-jev-filter/jev-filter.example.json
    printf '%s\n' "${finalAttrs.version}" > $out/share/maddy-jev-filter/VERSION
    runHook postInstall
  '';

  meta = with lib; {
    description = "Sort maddy mail into IMAP folders with TypeSafe's Jev";
    homepage = "https://github.com/lesderid/maddy-jev-filter";
    license = licenses.mit;
    maintainers = with maintainers; [ indexyz ];
    mainProgram = "maddy-jev-filter";
    platforms = platforms.linux;
  };
})
