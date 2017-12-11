function ls --wraps ls --description='List directory alias to either ls with coloring or exa'
    if type -q exa
        echo "Has exa"
        exa -bghHlSU --git
    else
        ls -C --color=auto
    end
end
