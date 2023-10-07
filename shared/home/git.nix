{ pkgs, ... }:
let conf = import ../conf.nix;
in {
  # Git
  programs = {
    git = {
      enable = true;
      diff-so-fancy.enable = true;
      userName = "${conf.gitUser}";
      userEmail = "${conf.gitMail}";
      signing = {
        key = null;
        signByDefault = false;
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
        pull = {
          ff = false;
          commit = false;
          rebuase = true;
        };
        fetch = { prune = true; };
        push = { autoSetupRemote = true; };
      };
    };
    # Gitui
    gitui.enable = true;
  };
}
