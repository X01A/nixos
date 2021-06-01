{ lib, linuxPackages_latest }:

linuxPackages_latest.extend (const (ksuper: {
  kernel =
    ksuper.kernel.override {
      extraConfig = ''
        CHROMEOS_LAPTOP y
        CHROMEOS_PSTORE y
      '';
      ignoreConfigErrors = true;
    };
}));
