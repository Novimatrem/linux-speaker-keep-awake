#!/bin/bash
# linux-speaker-keep-awake.sh

clear

# depends: pulseaudio, pulseaudio-utils

cd "$(dirname "$0")"
pulseaudio -k
killall pulseaudio
pkill pulseaudio
systemctl --user stop pulseaudio.service pulseaudio.socket
systemctl --user stop pulseaudio
systemctl --user restart pulseaudio
systemctl --user restart pulseaudio.service
systemctl --user restart pulseaudio.socket
killall pipewire
pipewire &
pipewire-pulse &
pulseaudio --start
pulseaudio
pulseaudio -D

clear
echo "linux-speaker-keep-awake.sh"
echo ""
echo "Preparing, wait 30 seconds..."
echo ""
pulseaudio --start
sleep 30s
echo "Continue to wait another 30 seconds..."
echo ""
pulseaudio --start
pulseaudio -k
sleep 30s
pulseaudio --start
amixer set Master unmute
amixer -q -D pulse sset Master unmute
pactl set-sink-mute 0 0
pactl set-sink-mute 1 0
pactl set-sink-mute @DEFAULT_SINK@ false
pactl set-sink-mute 2 0
pactl set-sink-mute 3 0
pactl set-sink-mute 4 0
pactl set-sink-mute 5 0
pactl set-sink-mute 6 0
pactl set-sink-mute 7 0
pactl set-sink-mute 8 0
pactl set-sink-mute 9 0
pactl set-sink-mute 10 0
pactl set-sink-mute 11 0
pactl set-sink-mute 12 0
pactl set-sink-mute 13 0
pactl set-sink-mute 14 0
pactl set-sink-mute 15 0
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out


cd "$(dirname "$0")"

notify-send "If you can hear this, your speakers will stay awake!"
paplay $(dirname "$0")/bleep.wav

while true
do
  clear
echo "Playing the sample to keep the speaker awake..."
echo ""
echo "Volume is being set fixed 64% or the sample causes distortion due to harmonic   audiofile nerd reasons..."
  echo "and also the more practical reason of"
  echo "the speaker-waking sample being less effective/disabled at lower/no volume(s),  that's dumb!"
  echo "Set all volumes for/in just individual applications instead."
  paplay $(dirname "$0")/warning-beep_distfix.wav

# Volume must be limited or the sample causes distortion due to harmonic audiofile nerd reasons...

echo ""
echo "Playing the sample to keep the speaker awake..."
echo ""
echo "Volume is being set fixed 64% or the sample causes distortion due to harmonic   audiofile nerd reasons..."
  echo "and also the more practical reason of"
  echo "the speaker-waking sample being less effective/disabled at lower/no volume(s),  that's dumb!"
  echo "Set all volumes for/in just individual applications instead."

x=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
if [[ $x -le 65 ]]
then
    amixer -D pulse sset Master 64%
    pactl set-sink-volume @DEFAULT_SINK@ 64%
    echo ""
    echo "Volume adjusted."
    echo ""
fi

if [[ $x -ge 66 ]]
then
    echo TOO_LOUD_DETECTED__FIXING
    amixer -D pulse sset Master 64%
    pactl set-sink-volume @DEFAULT_SINK@ 64%
fi

echo "Looping..."

    amixer -D pulse sset Master 64%
    pactl set-sink-volume @DEFAULT_SINK@ 64%

clear

  sleep 1

echo "Playing the sample to keep the speaker awake..."
echo ""
echo "Volume is being set fixed 64% or the sample causes distortion due to harmonic   audiofile nerd reasons..."
  echo "and also the more practical reason of"
  echo "the speaker-waking sample being less effective/disabled at lower/no volume(s),  that's dumb!"
  echo "Set all volumes for/in just individual applications instead."
done



shopt -s expand_aliases




