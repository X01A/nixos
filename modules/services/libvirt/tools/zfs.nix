{ ... }:
with builtins;
let
  supportedUnits = {
    K = "KB";
    KiB = "KB";
    M = "MB";
    MiB = "MB";
    G = "GB";
    GiB = "GB";
    T = "TB";
    TiB = "TB";
  };
in
{
  renderSize = size:
    if hasAttr size.unit supportedUnits then
      "${toString size.value}${supportedUnits.${size.unit}}"
    else throw "Unit ${size.unit} is not supported by ZFS. You may use: ${toString (attrNames supportedUnits)}";
}
