{ pkgs, ... }: {
  programs.firefox = {
    enable = if pkgs.stdenv.isLinux then
      true
    else
      false; # Disable firefox if not linux as it has only linux distributions
    package = pkgs.firefox;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        search.order = [ "Google" ];
        bookmarks = [
          {
            name = "Dev";
            bookmarks = [
              {
                name = "NewDawn0 (GitHub)";
                url = "https://github.com/NewDawn0?tab=repositories";
              }
              {
                name = "Crates.io | Rust packages";
                url = "https://crates.io";
              }
              {
                name = "Nix Packages";
                url = "https://search.nixos.org/packages";
              }
            ];
          }
          {
            name = "Search engines";
            bookmarks = [
              {
                name = "Phind";
                url = "https://www.phind.com";
              }
              {
                name = "You";
                url = "https://you.com";
              }
            ];
          }
          {
            name = "School";
            bookmarks = [
              {
                name = "Intranet KSWE";
                url = "https://intranet.kswe.ch/";
              }
              {
                name = "Schulnetz KSWE";
                url = "https://www.schul-netz.com/wettingen/index.php";
              }
            ];
          }
          {
            name = "Writing";
            bookmarks = [
              {
                name = "Quillbot | Plagiarism free rewriter";
                url = "http://quillbot.com/";
              }
              {
                name = "Spinbot | Artcicle rewriter";
                url = "http://spinbot.com/";
              }
              {
                name = "Text compactor";
                url = "http://textcompactor.com/";
              }
              {
                name = "Language tool";
                url = "https://languagetool.org";
              }
            ];
          }
          {
            name = "Knowledge";
            bookmarks = [
              {
                name = "Wikipedia";
                url =
                  "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
              }
              {
                name = "Kernel";
                url = "https://www.wiki.kernel.org";
              }
              {
                name = "OSDev";
                url = "https://wiki.osdev.org/Expanded_Main_Page";
              }
              {
                name = "Arch Linux";
                url = "https://wiki.archlinux.org";
              }
              {
                name = "NixOS";
                url = "https://nixos.wiki";
              }
              {
                name = "Linux Man Pages";
                url = "https://linux.die.net/man/";
              }
            ];
          }
          {
            name = "Misc";
            bookmarks = [
              {
                name = "Virus total";
                url = "http://virustotal.com/";
              }
              {
                name = "Corrupt a file";
                url = "http://corrupt-a-file.net/";
              }
              {
                name = "Image enlarger";
                url = "https://bigjpg.com";
              }
              {
                name = "Remove background";
                url = "https://www.remove.bg";
              }
              {
                name = "File converter";
                url = "https://cloudconvert.com";
              }
              {
                name = "PDF tools";
                url = "http://ilovepdf.com/";
              }
              {
                name = "Book piracy";
                url = "http://www.pdfdrive.com";
              }
              {
                name = "Sflix";
                url = "https://sflix.se";
              }
              {
                name = "9 Anime";
                url = "https://9anime.to";
              }
            ];
          }
        ];
      };
    };
  };
}
