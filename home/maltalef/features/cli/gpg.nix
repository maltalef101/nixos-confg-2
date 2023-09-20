{ pkgs, config, lib, ... }:
let
  pinentry =
    if config.gtk.enable then {
      packages = [ pkgs.pinentry-gnome pkgs.gcr ];
      name = "gnome3";
    } else {
      packages = [ pkgs.pinentry-curses ];
      name = "curses";
    };
in
{
  home.packages = pinentry.packages;

  services.gpg-agent = {
    enable = true;
    #enableSshSupport = true;
    pinentryFlavor = pinentry.name;
    #enableExtraSocket = true;
  };

  programs.gpg = {
    enable = true;
	  homedir = "${config.xdg.dataHome}/gnupg";
    settings.trust-model = "tofu+pgp";

    publicKeys = [{
      source = ../../pgp.asc;
      trust = 5;
    }];
  };

  #  systemd.user.services = {
  #    # Link /run/user/$UID/gnupg to ~/.gnupg-sockets
  #    # So that SSH config does not have to know the UID
  #    link-gnupg-sockets = {
  #      Unit = {
  #        Description = "link gnupg sockets from /run to /home";
  #      };
  #      Service = {
  #        Type = "oneshot";
  #        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/%U/gnupg %h/.gnupg-sockets";
  #        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
  #        RemainAfterExit = true;
  #      };
  #      Install.WantedBy = [ "default.target" ];
  #    };
  #  };
}
  # vim: filetype=nix
