function airtable_install -d "installs airtable stuff"
    # Make a logging directory
    mkdir -p /tmp/logs

    # Go to hyperbase directory
    pushd $HOME/h/source/hyperbase

    # Install toolchains
    ./admin/bin/configure_hyperbase_toolchains_if_necessary.sh

    # Clean typescript compiler
    tsc --build --clean

    # run pnpm install
    ./install_deps.sh

    # transpile so we can run grunt tasks
    grunt transpileOnce

    # run migrations for mysql and dynamo
    grunt admin:db:migrate | ./bin/bunyan
    grunt admin:dynamoDb:migrate
    popd
end
