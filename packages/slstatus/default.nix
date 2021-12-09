{ slstatus }:

slstatus.override {
  conf = builtins.readFile ./slstatus.config.h;
}
