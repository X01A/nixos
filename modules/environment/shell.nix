{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.base;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fishPlugins.z
      fishPlugins.tide
      fishPlugins.pisces
      fishPlugins.fzf-fish
    ];

    programs.fish.interactiveShellInit = ''
      set -Ux __fish_initialized 3400
      set -Ux _tide_left_items vi_mode os pwd git newline
      set -Ux _tide_right_items status cmd_duration context jobs node java go nix_shell time
      set -Ux fish_color_autosuggestion 555 brblack
      set -Ux fish_color_cancel -r
      set -Ux fish_color_command blue
      set -Ux fish_color_comment red
      set -Ux fish_color_cwd green
      set -Ux fish_color_cwd_root red
      set -Ux fish_color_end green
      set -Ux fish_color_error brred
      set -Ux fish_color_escape brcyan
      set -Ux fish_color_history_current --bold
      set -Ux fish_color_host normal
      set -Ux fish_color_host_remote yellow
      set -Ux fish_color_normal normal
      set -Ux fish_color_operator brcyan
      set -Ux fish_color_param cyan
      set -Ux fish_color_quote yellow
      set -Ux fish_color_redirection cyan --bold
      set -Ux fish_color_search_match bryellow --background =dbrblack
      set -Ux fish_color_selection white --bold --background =dbrblack
      set -Ux fish_color_status red
      set -Ux fish_color_user brgreen
      set -Ux fish_color_valid_path --underline
      set -Ux fish_key_bindings fish_default_key_bindings
      set -Ux fish_pager_color_completion normal
      set -Ux fish_pager_color_description B3A06D yellow -i
      set -Ux fish_pager_color_prefix normal --bold --underline
      set -Ux fish_pager_color_progress brwhite --background =dcyan
      set -Ux fish_pager_color_selected_background -r
      set -Ux tide_aws_bg_color FF9900
      set -Ux tide_aws_color 232F3E
      set -Ux tide_aws_icon \uf270
      set -Ux tide_character_color 5FD700
      set -Ux tide_character_color_failure FF0000
      set -Ux tide_character_icon \u276f
      set -Ux tide_character_vi_icon_default \u276e
      set -Ux tide_character_vi_icon_replace \u25b6
      set -Ux tide_character_vi_icon_visual V
      set -Ux tide_chruby_bg_color B31209
      set -Ux tide_chruby_color 000000
      set -Ux tide_chruby_icon \ue23e
      set -Ux tide_cmd_duration_bg_color C4A000
      set -Ux tide_cmd_duration_color 000000
      set -Ux tide_cmd_duration_decimals 0
      set -Ux tide_cmd_duration_icon \uf252
      set -Ux tide_cmd_duration_threshold 3000
      set -Ux tide_context_always_display false
      set -Ux tide_context_bg_color 444444
      set -Ux tide_context_color_default D7AF87
      set -Ux tide_context_color_root D7AF00
      set -Ux tide_context_color_ssh D7AF87
      set -Ux tide_context_hostname_parts 1
      set -Ux tide_crystal_bg_color FFFFFF
      set -Ux tide_crystal_color 000000
      set -Ux tide_crystal_icon \u2b22
      set -Ux tide_docker_bg_color 2496ED
      set -Ux tide_docker_color 000000
      set -Ux tide_docker_default_contexts default colima
      set -Ux tide_docker_icon \uf308
      set -Ux tide_git_bg_color 4E9A06
      set -Ux tide_git_bg_color_unstable C4A000
      set -Ux tide_git_bg_color_urgent CC0000
      set -Ux tide_git_color_branch 000000
      set -Ux tide_git_color_conflicted 000000
      set -Ux tide_git_color_dirty 000000
      set -Ux tide_git_color_operation 000000
      set -Ux tide_git_color_staged 000000
      set -Ux tide_git_color_stash 000000
      set -Ux tide_git_color_untracked 000000
      set -Ux tide_git_color_upstream 000000
      set -Ux tide_git_icon \uf1d3
      set -Ux tide_git_truncation_length 24
      set -Ux tide_go_bg_color 00ACD7
      set -Ux tide_go_color 000000
      set -Ux tide_go_icon \ue627
      set -Ux tide_java_bg_color ED8B00
      set -Ux tide_java_color 000000
      set -Ux tide_java_icon \ue256
      set -Ux tide_jobs_bg_color 444444
      set -Ux tide_jobs_color 4E9A06
      set -Ux tide_jobs_icon \uf013
      set -Ux tide_kubectl_bg_color 326CE5
      set -Ux tide_kubectl_color 000000
      set -Ux tide_kubectl_icon \u2388
      set -Ux tide_left_prompt_frame_enabled true
      set -Ux tide_left_prompt_items vi_mode os pwd git newline
      set -Ux tide_left_prompt_prefix \u2591\u2592\u2593
      set -Ux tide_left_prompt_separator_diff_color \ue0b0
      set -Ux tide_left_prompt_separator_same_color \ue0b1
      set -Ux tide_left_prompt_suffix \ue0b0
      set -Ux tide_nix_shell_bg_color 7EBAE4
      set -Ux tide_nix_shell_color 000000
      set -Ux tide_nix_shell_icon \uf313
      set -Ux tide_node_bg_color 44883E
      set -Ux tide_node_color 000000
      set -Ux tide_node_icon \u2b22
      set -Ux tide_os_bg_color 5277C3
      set -Ux tide_os_color FFFFFF
      set -Ux tide_os_icon \uf313
      set -Ux tide_php_bg_color 617CBE
      set -Ux tide_php_color 000000
      set -Ux tide_php_icon \ue608
      set -Ux tide_private_mode_bg_color F1F3F4
      set -Ux tide_private_mode_color 000000
      set -Ux tide_private_mode_icon \ufaf8
      set -Ux tide_prompt_add_newline_before false
      set -Ux tide_prompt_color_frame_and_connection 808080
      set -Ux tide_prompt_color_separator_same_color 949494
      set -Ux tide_prompt_icon_connection \u2500
      set -Ux tide_prompt_min_cols 34
      set -Ux tide_prompt_pad_items true
      set -Ux tide_pwd_bg_color 3465A4
      set -Ux tide_pwd_color_anchors E4E4E4
      set -Ux tide_pwd_color_dirs E4E4E4
      set -Ux tide_pwd_color_truncated_dirs BCBCBC
      set -Ux tide_pwd_icon \uf07c
      set -Ux tide_pwd_icon_home \uf015
      set -Ux tide_pwd_icon_unwritable \uf023
      set -Ux tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json
      set -Ux tide_right_prompt_frame_enabled true
      set -Ux tide_right_prompt_items status cmd_duration context jobs node virtual_env rustc java php chruby go kubectl toolbox terraform aws nix_shell crystal time
      set -Ux tide_right_prompt_prefix \ue0b2
      set -Ux tide_right_prompt_separator_diff_color \ue0b2
      set -Ux tide_right_prompt_separator_same_color \ue0b3
      set -Ux tide_right_prompt_suffix \u2593\u2592\u2591
      set -Ux tide_rustc_bg_color F74C00
      set -Ux tide_rustc_color 000000
      set -Ux tide_rustc_icon \ue7a8
      set -Ux tide_shlvl_bg_color 808000
      set -Ux tide_shlvl_color 000000
      set -Ux tide_shlvl_icon \uf120
      set -Ux tide_shlvl_threshold 1
      set -Ux tide_status_bg_color 2E3436
      set -Ux tide_status_bg_color_failure CC0000
      set -Ux tide_status_color 4E9A06
      set -Ux tide_status_color_failure FFFF00
      set -Ux tide_status_icon \u2714
      set -Ux tide_status_icon_failure \u2718
      set -Ux tide_terraform_bg_color 800080
      set -Ux tide_terraform_color 000000
      set -Ux tide_terraform_icon \x1d
      set -Ux tide_time_bg_color D3D7CF
      set -Ux tide_time_color 000000
      set -Ux tide_time_format \x25T
      set -Ux tide_toolbox_bg_color 613583
      set -Ux tide_toolbox_color 000000
      set -Ux tide_toolbox_icon \u2b22
      set -Ux tide_vi_mode_bg_color_default 949494
      set -Ux tide_vi_mode_bg_color_insert 87AFAF
      set -Ux tide_vi_mode_bg_color_replace 87AF87
      set -Ux tide_vi_mode_bg_color_visual FF8700
      set -Ux tide_vi_mode_color_default 000000
      set -Ux tide_vi_mode_color_insert 000000
      set -Ux tide_vi_mode_color_replace 000000
      set -Ux tide_vi_mode_color_visual 000000
      set -Ux tide_vi_mode_icon_default D
      set -Ux tide_vi_mode_icon_insert I
      set -Ux tide_vi_mode_icon_replace R
      set -Ux tide_vi_mode_icon_visual V
      set -Ux tide_virtual_env_bg_color 444444
      set -Ux tide_virtual_env_color 00AFAF
      set -Ux tide_virtual_env_icon \ue73c
    '';
  };
}
