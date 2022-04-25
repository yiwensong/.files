function giffi --description 'turns a video file into a gif'
    # install deps if not there
    if not type -q ffmpeg
        brew install ffmpeg
    end
    if not type -q gifsicle
        brew install gifsicle
    end

    set tmp_out (mktemp -d)/(basename $argv[2])
    ffmpeg -i $argv[1] -pix_fmt rgb8 -r 10 $tmp_out; and gifsicle -O3 $tmp_out -o $argv[2]
end
