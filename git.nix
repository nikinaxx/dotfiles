{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Nik Vozelj";
        email = "nik.vozelj@strips.eu";
      };
      init.defaultBranch = "master";
    };
  };
}
