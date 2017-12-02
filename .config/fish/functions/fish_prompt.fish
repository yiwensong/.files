function fish_prompt
    set sblue (set_color brblue)
    set syell (set_color yellow)
    set snorm (set_color normal)
    set sbrwt (set_color brmagenta)
    set sbryl (set_color yellow)
    set sbrgr (set_color cyan)
    # echo $sblue"["$sbryl(whoami)$sblue"@"$sbrwt(hostname) $snorm(date +%H:%M:%S)$sblue] $sbryl(prompt_pwd)
    # echo $snorm"\$ "

    set local_ids C02V20DBHTD8

    # set user "$sbryl"(whoami)"$snorm"
    set islocal 0
    for id in $local_ids
      if [ (hostname) = $id ]
        set islocal 1
        break
      end
    end

    if [ $islocal = 1 ]
      set user "$sbrgr"(whoami)"$snorm"
    else
      set user "$sbryl"(whoami)"$snorm"
    end
    set host "$sbrwt"(hostname)"$snorm"
    set tstamp "$snorm"(date +%H:%M:%S)"$snorm"
    set path "$sbryl"(prompt_pwd)"$snorm"

    printf "%s[%s%s@%s %s%s] %s%s%s\n%s\$ \n" $sblue $user $sblue $host $tstamp $sblue $path $snorm
end
