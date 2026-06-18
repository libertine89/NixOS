# ## CHANGE
# F8 has been rebound to Tap And Hold for Space in Kanata Service
#
[
  {
    unbind = {
      "ctrl-`" = "terminal_panel::Toggle";
      "ctrl-h" = "buffer_search::DeployReplace";
      "ctrl-q" = "zed::Quit";
    };

    bindings = {
      "ctrl-t" = "terminal_panel::Toggle";
      "F8 shift-e" = "project_panel::Toggle";
      "F8 /" = "buffer_search::DeployReplace";
      "ctrl-q" = "pane::CloseActiveItem";
      "shift-alt-k" = [
        "editor::AddSelectionAbove"
        { "skip_soft_wrap" = true; }
      ]; # Insert Cursor Above
      "shift-alt-j" = [
        "editor::AddSelectionBelow"
        { "skip_soft_wrap" = true; }
      ]; # Insert Cursor Below
    };
  }

  {
    context = "Workspace";

    unbind = {
      "ctrl-b" = "workspace::ToggleLeftDock";
      "ctrl-shift-e" = "project_panel::ToggleFocus";
      "ctrl-p" = "file_finder::Toggle";
      "ctrl-shift-f" = "project_search::ToggleFocus";
    };

    bindings = {
      "F8 e" = "project_panel::ToggleFocus";
      "F8 f" = "file_finder::Toggle";
      "F8 s c" = "git_panel::Toggle";
      "F8 ?" = "project_search::ToggleFocus";
    };
  }

  {
    context = "vim_mode == normal || vim_mode == insert || vim_mode == visual";

    bindings = {
      "F8 p" = [
        "editor::Paste"
        {
          preserve_clipboard = true;
        }
      ];
    };
  }

  {
    context = "vim_mode == normal || vim_mode == visual || vim_mode == operator";

    unbind = {
      "] e" = "editor::MoveLineDown";
      "[ e" = "editor::MoveLineUp";
    };

    bindings = {
      "alt-j" = "editor::MoveLineDown";
      "alt-k" = "editor::MoveLineUp";
    };
  }

  {
    context = "VimControl && !menu";

    unbind = {
      "0" = "vim::StartOfLine";
      "$" = "vim::EndOfLine";
    };

    bindings = {
      "ctrl-b" = "vim::StartOfLine";
      "ctrl-e" = "vim::EndOfLine";
    };
  }

  {
    context = "(vim_mode == helix_normal || vim_mode == helix_select) && !menu";

    bindings = {
      "F8 p" = "editor::Paste";
    };
  }

  {
    context = "Editor && vim_mode == insert";

    bindings = {
      "j k" = "vim::NormalBefore";
    };
  }

  {
    context = "ProjectPanel && not_editing";

    unbind = {
      "escape" = "vim::ToggleProjectPanelFocus";
    };

    bindings = {
      "F8 e" = "vim::ToggleProjectPanelFocus";
    };
  }

  {
    context = "AgentPanel";

    unbind = {
      "ctrl-shift-e" = "project_panel::ToggleFocus";
    };

    bindings = {
      "F8 e" = "project_panel::ToggleFocus";
    };
  }

  {
    context = "BufferSearchBar";

    unbind = {
      "ctrl-h" = "search::ToggleReplace";
    };

    bindings = {
      "F8 /" = "search::ToggleReplace";
    };
  }
]
#### TEST ###
#### CHANGE
