{ unstable, ... }:
let conf = import ./../../../config.nix;
in {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    userName = "${conf.git.user}";
    userEmail =
      "${conf.git.mail}"; # OR: email = 92283105+NewDawn0@users.noreply.github.com
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
        helper =
          "${unstable.git-credential-manager}/bin/git-credential-manager";
      };
      "credential \"https://dev.azure.com\"" = { useHttpPath = true; };
      fetch = { prune = true; };
      push = { autoSetupRemote = true; };
    };
  };
}
