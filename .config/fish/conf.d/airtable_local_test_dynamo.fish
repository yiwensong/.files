if status --is-login
    # wait for docker to start, this happens at boot time.
    while not docker info > /dev/null
        sleep 1
    end

    set dynamo_dev $HOME/h/source/hyperbase/dynamodb/docker-compose.dev.yml
    set dynamo_test $HOME/h/source/hyperbase/dynamodb/docker-compose.test.yml

    docker compose --file $dynamo_dev --file $dynamo_test up --detach > /dev/null 2>&1
end
