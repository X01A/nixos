{ source, lib, buildLinux, modDirVersionArg ? null, ... } @ args:

with lib;

buildLinux (args // rec {
  inherit (source) version src;
  extraMeta.branch = lib.versions.majorMinor version;

  # modDirVersion needs to be x.y.z, will always add .0
  modDirVersion = if (modDirVersionArg == null) then builtins.replaceStrings [ "-" ] [ ".0-" ] version else modDirVersionArg;

  extraMeta.hydraPlatforms = [ ];
} // (args.argsOverride or { }))
