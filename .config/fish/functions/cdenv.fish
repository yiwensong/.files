function cdenv -d "cd but it activates envs"
    __autoenv $argv[1]
    cd $argv[1]
end

function __autoenv -d "automatically checks for environments and activates them"
    if type -q deactivate_node
        deactivate_node
    end

    set node_version (jq --raw-output '.nodejsVersion' $HOME/h/source/hyperbase/admin/runtime_setup/default.json)

    if not test -z $argv[1]
        # pushd so we can use pwd canonical form
        pushd $argv[1]
    else
        pushd $HOME
    end

    if string match --quiet $HOME"/h/source/*" (pwd)
        source $HOME/h/node/env-$node_version/bin/activate.fish
    end

    popd
end
