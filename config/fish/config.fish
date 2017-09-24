# Aliases
source ~/.config/fish/aliases.fish

# direnv
# https://direnv.net/
if type -P direnv
    eval (direnv hook fish)
end

# nix
eval (~/.config/fish/misc/nix_fish_env.sh) 2>/dev/null

#eval (python -m virtualfish)

#set -x PATH /home/roberto/texlive/2016/bin/x86_64-linux $PATH

#set -x MATH_ROOT /opt/intel/compilers_and_libraries_2016.0.109/linux/mkl

#set -x PGI /opt/pgi

#set -x LM_LICENSE_FILE /opt/pgi/license.dat

#source /home/roberto/.config/fish/conda.fish

#set -x PSI_SCRATCH /home/roberto/Scratch/psi4scr
