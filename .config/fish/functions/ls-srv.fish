function ls-srv
    sc ls-servers --map srfc39_fqdn $argv 2>&1 | rg 'i-.*\.' |  cut -f-1
end
