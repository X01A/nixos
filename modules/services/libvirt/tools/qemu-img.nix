{ ... }:
with builtins;
let
  supportedUnits = {
    K = "K";
    KiB = "K";
    M = "M";
    MiB = "M";
    G = "G";
    GiB = "G";
    T = "T";
    TiB = "T";
  };
in
{
  renderSize =
    size:
    if hasAttr size.unit supportedUnits then
      "${toString size.value}${supportedUnits.${size.unit}}"
    else
      throw "Unit ${size.unit} is not supported by qemu-img. You may use: ${toString (attrNames supportedUnits)}";
}
