# do you have updog?
# what's updog?
# just editing my up.fish

function up -d 'cd up directory with int param'
    if test (count $argv) -eq 0
        # Default to `up 1` if no arguments provided
        set levels 1
    else
        # + 0 is used to cast to int
        set levels (math $argv[1] + 0)
    end

    for i in (seq $levels)
        set path "../$path"
    end

    if test -n $path
        cdenv $path
    end
end
