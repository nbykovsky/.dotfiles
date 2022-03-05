{ config, pkgs, stdenv, ... }:
let
  sr = pkgs.fetchFromGitHub {
    owner = "streetturtle";
    repo = "awesome-wm-widgets";
    rev = "b8e3a861f4829b2c3820e9a40294a3d9125fbf23";
    sha256 = "0vxbx38c390rd2ysvbwgh89v2232sh5rbsp3nk9wzb70jybpslvl";
  };
in
  stdenv.mkDeriviation {
    name = "awesome-widgets";
    src = sr;  
  }
