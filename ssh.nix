{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        IdentitiesOnly = true;
      };
      "github-strips" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_github_strips";
      };
      "github-nikinaxx" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_github_nikinaxx";
      };
      "github-nikvozelj" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_github_nikvozelj";
      };
      "git.strips.eu" = {
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519_gitlab";
      };
    };
  };
}
