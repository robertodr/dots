function fish_prompt --description 'Write out the prompt'
   # $status gets nuked as soon as something else is run, e.g. set_color
   # so it has to be saved asap.
   set -l last_status $status

   # Just calculate these once, to save a few cycles when displaying the prompt
   if not set -q __fish_prompt_hostname
     set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
   end
   if not set -q __fish_prompt_char
     switch (id -u)
       case 0
         set -g __fish_prompt_char '# '
       case '*'
         set -g __fish_prompt_char '美男象 '
     end
   end

   # Set up colors
   set -l normal (set_color normal)
   set -l white (set_color FFFFFF)
   set -l turquoise (set_color 5fdfff)
   set -l orange (set_color df5f00)
   set -l hotpink (set_color df005f)
   set -l blue (set_color blue)
   set -l limegreen (set_color 87ff00)
   set -l purple (set_color af5fff)

   # Configure __fish_git_prompt
   ## Stuff to show
   set -g __fish_git_prompt_show_informative_status true
   set -g __fish_git_prompt_showupstream true
   set -g __fish_git_prompt_showdirtystate true
   set -g __fish_git_prompt_showuntrackedfiles true
   set -g __fish_git_prompt_showstashstate true
   ## Separators
   set -g __fish_git_prompt_char_stateseparator $normal'|'
   set -g __fish_git_prompt_char_upstream_prefix ''
   ## Colors
   set -g __fish_git_prompt_color_branch 5fdfff
   set -g __fish_git_prompt_char_upstream_ahead $orange'↑'
   set -g __fish_git_prompt_char_upstream_behind $hotpink'↓'
   set -g __fish_git_prompt_color_cleanstate 87ff00
   set -g __fish_git_prompt_color_stagedstate yellow
   set -g __fish_git_prompt_color_invalidstate red
   set -g __fish_git_prompt_color_dirtystate green
   set -g __fish_git_prompt_color_untrackedfiles blue

   # Prompt: line 1
   echo -n $white'╭─'$hotpink$USER$white'@'$orange$__fish_prompt_hostname$white':'$limegreen(shortened_path)
   echo

   # Nix Shell
   set -g __nixshell_fish_prompt ""
   if set -q IN_NIX_SHELL
     set __nixshell_fish_prompt (set_color purple)"[nix-shell]"(set_color normal)" "
   end

   # Prompt: line 2
   echo -n $white'╰─ '$__fish_prompt_char$__nixshell_fish_prompt
   __fish_git_prompt "(%s) "
end

function shortened_path --description 'Print shortened current working directory'
   # Abbreviate $HOME to ~
   set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
   echo -n (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
end
