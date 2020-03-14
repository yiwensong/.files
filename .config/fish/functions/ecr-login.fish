function ecr-login -d 'logs you into ecr'
    sc env stripe.io --role admin
    set ecr_login_cmd (sc aws ecr get-login --no-include-email --region us-west-2 | string split " ")
    echo $ecr_login_cmd
    $ecr_login_cmd
end
