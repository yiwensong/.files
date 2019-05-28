function __complete_sc
  set -lx COMP_LINE (string join -- ' ' (commandline -o))
  test (commandline -ct) = ""
  and set COMP_LINE "$COMP_LINE "
  /Users/yiwen/stripe/space-commander/bin/commands/sc-complete
end
complete -f -c sc -a "(__complete_sc)"
