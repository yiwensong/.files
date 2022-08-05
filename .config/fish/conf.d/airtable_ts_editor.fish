# This script is jank af
if status --is-login
    # We don't make the `node_modules/.bin` dir anymore, for whatever
    # reason. So we manually make it lol
    set NODE_MODULES $HOME/h/source/hyperbase/node_modules
    mkdir -p $NODE_MODULES/.bin/

    # If the binaries are not here, add them.
    if not test -e $NODE_MODULES/.bin/prettier
        ln -s $NODE_MODULES/prettier/bin-prettier.js $NODE_MODULES/.bin/prettier
    end

    if not test -e $NODE_MODULES/.bin/tsserver
        ln -s $NODE_MODULES/typescript/bin/tsserver $NODE_MODULES/.bin/tsserver
        ln -s $NODE_MODULES/typescript/bin/tsc $NODE_MODULES/.bin/tsc
    end

    set fish_user_paths $HOME/h/source/hyperbase/node_modules/typescript/bin/ $fish_user_paths
end
