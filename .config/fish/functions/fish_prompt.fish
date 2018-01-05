function fish_prompt
    set __prompt_status $status
    set sblue (set_color brblue)
    set syell (set_color yellow)
    set snorm (set_color normal)
    set sbrwt (set_color brmagenta)
    set sbryl (set_color yellow)
    set sbrgr (set_color cyan)
    # echo $sblue"["$sbryl(whoami)$sblue"@"$sbrwt(hostname) $snorm(date +%H:%M:%S)$sblue] $sbryl(prompt_pwd)
    # echo $snorm"\$ "

    # set local_ids C02V20DBHTD8 YSONG121849

    # set user "$sbryl"(whoami)"$snorm"
    # set islocal 0
    # for id in $local_ids
    #   if [ (hostname) = $id ]
    #     set islocal 1
    #     break
    #   end
    # end

    if [ $IS_LOCAL = 1 ]
      set user "$sbrgr"(whoami)"$snorm"
    else
      set user "$sbryl"(whoami)"$snorm"
    end
    set host "$sbrwt"(hostname)"$snorm"
    set tstamp "$snorm"(date +%H:%M:%S)"$snorm"
    set path "$sbryl"(prompt_pwd)"$snorm"

    printf "%s[%s%s🌮 %s %s%s] %s%s%s\n%s" $sblue $user $sblue $host $tstamp $sblue $path $snorm
    if test $__prompt_status -ne 0
        __fail_emoji
    else
        __success_emoji
    end
end


function __success_emoji -d "makes a success emoji"
    set rand (random)
    set big 32767
    if test $rand -lt (echo $big"/5" | bc)
        printf "👌  \n"
    else if test $rand -lt (echo $big"*2/5" | bc)
        printf "🙏  \n"
    else if test $rand -lt (echo $big"*3/5" | bc)
        printf "👍  \n"
    else if test $rand -lt (echo $big"*4/5" | bc)
        printf "🙌  \n"
    else
        printf "✌️  \n"
    end
end


function __fail_emoji -d "makes a failure emoji"
    printf "🔥  \n"
end
