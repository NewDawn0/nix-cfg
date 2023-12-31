{
  programs.bash = {
    enable = true;
    historyControl = [ "ignoredups" ];
    historyFile = "$HOME/.config/bash/.bash_history";
    historyFileSize = 10000;
    historyIgnore = [ "ls" "exit" "cd" ];
    shellOptions =
      [ "histappend" "checkwinsize" "extglob" "globstar" "checkjobs" ];
    initExtra = ''
      source ~/.cargo/env
      function ex () {
          if [ -f "$1" ] ; then
              case $1 in
                  *.tar.bz2)   tar xjf $1   ;;
                  *.tar.gz)    tar xzf $1   ;;
                  *.bz2)       bunzip2 $1   ;;
                  *.rar)       unrar x $1   ;;
                  *.gz)        gunzip $1    ;;
                  *.tar)       tar xf $1    ;;
                  *.tbz2)      tar xjf $1   ;;
                  *.tgz)       tar xzf $1   ;;
                  *.zip)       unzip $1     ;;
                  *.Z)         uncompress $1 ;;
                  *.7z)        7z x $1      ;;
                  *.deb)       ar x $1      ;;
                  *.tar.xz)    tar xf $1    ;;
                  *.tar.zst)   unzstd $1    ;;
                  *)           echo "'$1' cannot be extracted via ex()" ;;
              esac
          else
              echo "'$1' is not a valid file"
          fi
      }
      function up () {
          local d=""
          local limit="$1"

          # Default to limit of 1
          if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
              limit=1
          fi

          for ((i=1;i<=limit;i++)); do
              d="../$d"
          done
          # perform cd. Show error if cd fails
          if ! cd "$d"; then
              echo "Couldn't go up $limit dirs.";
          fi
      }
      function loop() {
          while true; do
              $1 ''${@:2}
              read && clear
          done
      }
    '';
  };
}
