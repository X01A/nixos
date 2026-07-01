{ self, lib, ... }:

let
  inherit (builtins)
    attrNames
    attrValues
    concatLists
    elem
    filter
    pathExists
    readDir
    stringLength
    substring
    ;
  inherit (lib)
    filterAttrs
    hasPrefix
    hasSuffix
    id
    init
    last
    mapAttrsToList
    nameValuePair
    removeSuffix
    splitString
    ;
  inherit (self.attrs) mapFilterAttrs;
in
rec {
  mapModules =
    dir: fn:
    mapFilterAttrs (n: v: v != null && !(hasPrefix "_" n)) (
      n: v:
      let
        path = "${toString dir}/${n}";
      in
      if v == "directory" && pathExists "${path}/default.nix" then
        nameValuePair n (fn path)
      else if v == "regular" && n != "default.nix" && hasSuffix ".nix" n then
        nameValuePair (removeSuffix ".nix" n) (fn path)
      else
        nameValuePair "" null
    ) (readDir dir);

  mapModules' = dir: fn: attrValues (mapModules dir fn);

  mapModulesRec =
    dir: fn:
    mapFilterAttrs (n: v: v != null && !(hasPrefix "_" n)) (
      n: v:
      let
        path = "${toString dir}/${n}";
      in
      if v == "directory" then
        nameValuePair n (mapModulesRec path fn)
      else if v == "regular" && n != "default.nix" && hasSuffix ".nix" n then
        nameValuePair (removeSuffix ".nix" n) (fn path)
      else
        nameValuePair "" null
    ) (readDir dir);

  mapModulesRec' =
    dir: fn:
    let
      dirs = mapAttrsToList (k: _: "${dir}/${k}") (
        filterAttrs (n: v: v == "directory" && !(hasPrefix "_" n)) (readDir dir)
      );
      files = attrValues (mapModules dir id);
      paths = files ++ concatLists (map (d: mapModulesRec' d id) dirs);
    in
    map fn paths;

  moduleEntrypoints =
    dir:
    let
      entries = readDir dir;
      names = attrNames entries;
      helperEntrypointNames = [
        "utils.nix"
        "library.nix"
        "models.nix"
      ];
      isHelperEntrypointName = n: elem n helperEntrypointNames || hasSuffix "-options.nix" n;
      entrypointFor =
        n:
        let
          kind = entries.${n};
          path = dir + "/${n}";
        in
        if hasPrefix "_" n || isHelperEntrypointName n then
          null
        else if kind == "directory" && pathExists (path + "/default.nix") then
          path
        else if kind == "regular" && n != "default.nix" && hasSuffix ".nix" n then
          path
        else
          null;
    in
    filter (path: path != null) (map entrypointFor names);

  moduleEntrypointsFromDirs =
    root: dirs:
    concatLists (map (dir: moduleEntrypoints (root + "/${dir}")) dirs);

  moduleOptionPath =
    root: path:
    let
      rootString = toString root;
      pathString = toString path;
      rootPrefix = "${rootString}/";
      relative =
        if hasPrefix rootPrefix pathString then
          substring (stringLength rootPrefix) (stringLength pathString) pathString
        else
          pathString;
      parts = splitString "/" relative;
      lastPart = last parts;
      parentParts = init parts;
      normalizedParts =
        if lastPart == "default.nix" then
          parentParts
        else if hasSuffix ".nix" lastPart then
          parentParts ++ [ (removeSuffix ".nix" lastPart) ]
        else
          parts;
    in
    [ "indexyz" ] ++ normalizedParts;
}
