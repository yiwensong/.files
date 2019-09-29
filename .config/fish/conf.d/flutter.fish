function flutter_clean
    echo "Cleaning up previous installation of flutter"
    rm -rf $HOME/.flutter/
end

if status --is-login; and status --is-interactive
    set FLUTTER_VERSION 'v1.9.1+hotfix.2-stable'
    set FILE_PATH 'stable/linux/flutter_linux_'$FLUTTER_VERSION'.tar.xz'
    set URL_BASE 'https://storage.googleapis.com/flutter_infra/releases/'
    set DOWNLOAD_URL $URL_BASE$FILE_PATH

    set DOWNLOAD_PATH '/tmp/flutter_linux_'$FLUTTER_VERSION'.tar.xz'

    if not test -e $DOWNLOAD_PATH
        flutter_clean

        echo "Downloading flutter"
        curl \
            --fail \
            --location \
            --output $DOWNLOAD_PATH \
            $DOWNLOAD_URL
    end

    if not test -e $HOME/.flutter/
        echo "Extracting flutter"
        mkdir $HOME/.flutter
        tar --extract --file=$DOWNLOAD_PATH --directory=$HOME/.flutter
    end

    set fish_user_paths $HOME/.flutter/flutter/bin $fish_user_paths
end
