# Devices

Device renderers take device-specific configurations as input, and emit XML fragments to be included in the libvirt domain's `<devices>` section.
They may also emit `provisionScript`s to be executed before the domain starts as well as other things (e.g., hints for the networking modules to configure DHCP).

Here a custom NixOS-ish module system powered by `lib.evalModules` is used for type-checking and configuration merging.


## Network adapters

Devices which act like network adapters should expose `network` in the rendered configurations, containing information on how the guest can be reached from the host.
