# TPM devices

{ pkgs, ... }:
with builtins;
{
  construct =
    {
      version ? "2.0",
    }:
    {
      type = "tpm";
      config = { inherit version; };
    };
  render = device: machineName: machine: {
    deviceStanza = ''
      <tpm model='tpm-tis'>
        <backend type='emulator' version='${device.config.version}' />
      </tpm>
    '';

    provisionScript = "";
  };
}
