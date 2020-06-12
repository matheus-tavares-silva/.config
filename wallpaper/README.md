## To reduces use of cpu because the live wallpapper uses the command behind for increase performance:

ffmpeg -i <vid_1> -i <vid_2> -filter_complex '[0:v]pad=iw*2:ih[int];[int][1:v]overlay=W/2:0[vid]' -map '[vid]'  -c:v libx264 -crf 23 -preset veryfast output.mp4

