function airtable_install -d "installs airtable stuff"
    pushd $HOME/h/source/hyperbase
    ./yarn_install.sh
    grunt transpileOnce
    grunt admin:db:migrate | ./bin/bunyan
    grunt admin:dynamoDb:migrate
    popd
end
