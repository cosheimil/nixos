{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      nvarner.typst-lsp
      tomoki1207.pdf
      ms-python.python
      ms-vscode-remote.remote-ssh
      ms-azuretools.vscode-docker
    ];
    userSettings = {
      "files.autoSave" = "on";
      "[nix]"."editor.tabSize" = 2;
    };
    # mutableExtensionsDir = true;
  };
}

