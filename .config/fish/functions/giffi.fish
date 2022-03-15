function giffi --description 'turns a video file into a gif'
    # install deps if not there
    if not type -q ffmpeg
        brew install ffmpeg
    end
    if not type -q gifsicle
        brew install gifsicle
    end

    ffmpeg -i $argv[1] -pix_fmt rgb8 -r 10 $argv[2]; and gifsicle -O3 $argv[2] -o $argv[2]
end
