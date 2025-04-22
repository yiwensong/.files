if status --is-login
    status --file

    if test -n docker
        return 0
    end

    # wait for docker to start, this happens at boot time.
    while not docker info > /dev/null
        sleep 1
    end

    set dynamo_dev $HOME/h/source/hyperbase/dynamodb/docker-compose.dev.yml
    set dynamo_test $HOME/h/source/hyperbase/dynamodb/docker-compose.test.yml
    set localstack $HOME/h/source/hyperbase/localstack/docker-compose.dev.yml

    docker compose --file $dynamo_dev --file $dynamo_test --file $localstack up --detach > /dev/null 2>&1
end
