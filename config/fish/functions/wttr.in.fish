function wttr.in --description 'Get weather info on the terminal'
    curl "wttr.in/$argv[1]?m1"
end
