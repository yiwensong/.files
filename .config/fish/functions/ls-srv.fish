function ls-srv
    sc ls-servers --map srfc39_fqdn $argv 2>&1 | rg 'i-.*\.' |  awk -F" " '{print $NF}'
end
