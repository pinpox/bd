
{
  description = "A flake for building Hello World";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };

      pkgs.writeScriptBin "cheer" ''
        cat << EOF

                             /^\
                   /         (/^\)     /
              \   ( \         \ /     ( \     /^\
             / )   \ |        _|_      \ |   |/^\|
            | /    _|_        | |      _|_    \ /
            _|_    | |        | |      | |    _|_
            | |    | |        | |      | |    | |
            | |    | |    ****| |******| |    | |
            | |****| |****    | |      | |****| |
           *| |    | |                 | |    | |*****
         *  | |   H  A  P  P  Y               | |      *
        *                                               *
        | *            B  I  R  T  H  D  A  Y  !      * |
        |  *****                                 *****  |
        |@      **********             **********      @|
        | @   @           *************           @   @ |
        |  @@@ @    @                       @    @ @@@  |
        |       @@@@ @      @       @      @ @@@@       |
         *            @@@@@@ @     @ @@@@@@            *
          *                   @@@@@                   *
           *****                                 *****
                **********             **********
                          *************
        EOF
        '';

      defaultApp.x86_64-linux = { type = "app"; program = "${self.defaultPackage.x86_64-linux }/bin/cheer"; };

  };
}
