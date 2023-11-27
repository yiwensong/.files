set FLUTTER_PATH $HOME/local_install/

function flutter_clean
    echo "Cleaning up previous installation of flutter"
    rm -rf $FLUTTER_PATH
end

# if status --is-login; and status --is-interactive
#     status --file
#     set fish_user_paths $FLUTTER_PATH/flutter/bin $fish_user_paths

#     set FLUTTER_VERSION 'v1.9.1+hotfix.2-stable'
#     set FILE_PATH 'stable/linux/flutter_linux_'$FLUTTER_VERSION'.tar.xz'
#     set URL_BASE 'https://storage.googleapis.com/flutter_infra/releases/'
#     set DOWNLOAD_URL $URL_BASE$FILE_PATH

#     set DOWNLOAD_PATH '/tmp/flutter_linux_'$FLUTTER_VERSION'.tar.xz'

#     if not test -e $DOWNLOAD_PATH; and not which flutter
#         flutter_clean

#         echo "Downloading flutter"
#         curl \
#             --fail \
#             --location \
#             --output $DOWNLOAD_PATH \
#             $DOWNLOAD_URL
#     end

#     if not test -e $FLUTTER_PATH
#         echo "Extracting flutter"
#         mkdir -p $FLUTTER_PATH
#         tar --extract --file=$DOWNLOAD_PATH --directory=$FLUTTER_PATH
#     end
# end
