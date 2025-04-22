if status is-interactive
    # Commands to run in interactive sessions can go here
end

# added by setup_fb4a.sh
set -x ANDROID_SDK /opt/android_sdk
set -x ANDROID_NDK_REPOSITORY /opt/android_ndk
set -x ANDROID_HOME {$ANDROID_SDK}
fish_add_path {$ANDROID_SDK}/emulator {$ANDROID_SDK}/tools {$ANDROID_SDK}/tools/bin {$ANDROID_SDK}/platform-tools
