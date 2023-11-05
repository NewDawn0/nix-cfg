{ pkgs, ... }:
let conf = import ../../conf.nix;
in {
  # Git
  programs = {
    git = {
      enable = conf.home-mods.git;
      diff-so-fancy.enable = true;
      userName = "${conf.gitUser}";
      userEmail =
        "${conf.gitMail}"; # OR: 	email = 92283105+NewDawn0@users.noreply.github.com
      signing = {
        key = "13DFF28297501A33";
        signByDefault = true;
      };
      ignores = [
        # IDE
        ".idea"
        ".vs"
        ".vsc"
        ".vscode"
        # npm
        "node_modules"
        "npm-debug.log"
        # python
        "__pycache__"
        "*.pyc"
        ".ipynb_checkpoints" # jupyter
        "__sapper__" # svelte
        ".DS_Store" # mac
      ];
      extraConfig = {
        init.defaultBranch = "main";
        commit.gpgsign = true;
        pull = {
          ff = false;
          commit = false;
          rebuase = true;
        };
        credential = {
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };
        "credential \"https://dev.azure.com\"" = { useHttpPath = true; };
        fetch = { prune = true; };
        push = { autoSetupRemote = true; };
      };
    };
    # Gitui
    gitui.enable = conf.home-mods.git;
    # GitHub
    gh = {
      enable = conf.home-mods.git;
      package = pkgs.gh;
      gitCredentialHelper.enable = true;
      settings = {
        git_protocol = "ssh";
        editor = "${pkgs.neovim}/bin/nvim";
      };
    };
  };
}
