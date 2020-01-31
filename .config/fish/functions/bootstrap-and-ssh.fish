function bootstrap-and-ssh -d 'bootstraps a box with configs and sshs into it'
    if test (count $argv) -eq 0
        echo "Usage:"
        echo "bootstrap-and-ssh [target] ([flags] [command])"
    end

    set target_box $argv[1]

    if ssh $target_box test -f '$HOME/.vimrc'
        ssh -t fish $argv
        return
    end

    echo "Box is not bootstrapped, so we are going to bootstrap it..."
    set bootstrap_zip "https://github.com/yiwensong/.files/archive/master.zip"
    set tempdir (mktemp -d -t bootstrap)

    curl --fail --location --output $tempdir/dotfiles.zip $bootstrap_zip

    rsync --recursive $tempdir/dotfiles.zip $target_box:~

    ssh $target_box unzip -u '$HOME/dotfiles.zip' -d '$HOME'
    ssh $target_box fish '$HOME/.files-master/bootstrap.fish'

    # Comment this next line out for debugging
    rm -rf $tempdir

    ssh -t fish $argv
end
