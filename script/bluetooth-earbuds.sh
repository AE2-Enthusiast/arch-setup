#! /bin/sh

trap stop_pulse 1 2 3 6
stop_pulse()
{
    systemctl --user stop pulseaudio
    exit 1
}


systemctl --user start pulseaudio
bluetoothctl connect B8:21:1C:57:8B:A2
while true
do
    sleep 1d
done
