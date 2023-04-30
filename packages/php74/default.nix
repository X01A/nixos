{ nixpkgs, callPackage, lib, stdenv, php, rsync, autoconf, pkg-config, re2c, ... }:

let
  mkExtension = lib.makeOverridable
    ({ name
     , configureFlags ? [ "--enable-${extName}" ]
     , internalDeps ? [ ]
     , postPhpize ? ""
     , buildInputs ? [ ]
     , zendExtension ? false
     , doCheck ? true
     , extName ? name
     , ...
     }@args: stdenv.mkDerivation ((builtins.removeAttrs args [ "name" ]) // {
      pname = "php-${name}";
      extensionName = extName;

      outputs = [ "out" "dev" ];

      inherit (base) version src;

      enableParallelBuilding = true;

      nativeBuildInputs = [
        base
        autoconf
        pkg-config
        re2c
      ];

      inherit configureFlags internalDeps buildInputs zendExtension doCheck;

      preConfigurePhases = [
        "cdToExtensionRootPhase"
      ];

      cdToExtensionRootPhase = ''
        # Go to extension source root.
        cd "ext/${extName}"
      '';

      preConfigure = ''
        nullglobRestore=$(shopt -p nullglob)
        shopt -u nullglob   # To make ?-globbing work

        # Some extensions have a config0.m4 or config9.m4
        if [ -f config?.m4 ]; then
          mv config?.m4 config.m4
        fi

        $nullglobRestore

        phpize
        ${postPhpize}

        ${lib.concatMapStringsSep
          "\n"
          (dep: "mkdir -p ext; ln -s ${dep.dev}/include ext/${dep.extensionName}")
          internalDeps
        }
      '';

      checkPhase = ''
        runHook preCheck

        NO_INTERACTION=yes SKIP_PERF_SENSITIVE=yes make test
        runHook postCheck
      '';

      installPhase = ''
        runHook preInstall

        mkdir -p $out/lib/php/extensions
        cp modules/${extName}.so $out/lib/php/extensions/${extName}.so
        mkdir -p $dev/include
        ${rsync}/bin/rsync -r --filter="+ */" \
          --filter="+ *.h" \
          --filter="- *" \
          --prune-empty-dirs \
          . $dev/include/

        runHook postInstall
      '';

      meta = {
        description = "PHP upstream extension: ${name}";
        inherit (php.meta) maintainers homepage license;
      };
    }));

  base = callPackage "${toString nixpkgs}/pkgs/development/interpreters/php/generic.nix" ({
    version = "7.4.33";
    hash = "sha256-ToEXRY/lpHW/IDEocmtxvLumHEKtRj3/re5WZ6GYqYo=";
  });
in
base.withExtensions ({ all, ... }: with all; ([
  bcmath
  calendar
  curl
  ctype
  dom
  exif
  fileinfo
  filter
  ftp
  gd
  gettext
  gmp
  iconv
  intl
  (mkExtension { name = "json"; })
  ldap
  mbstring
  mysqli
  mysqlnd
  opcache
  openssl
  pcntl
  pdo
  pdo_mysql
  pdo_odbc
  pdo_pgsql
  pdo_sqlite
  pgsql
  posix
  readline
  session
  simplexml
  sockets
  soap
  sodium
  sqlite3
  tokenizer
  xmlreader
  xmlwriter
  zip
  zlib
] ++ lib.optionals (!stdenv.isDarwin) [ imap ]))
