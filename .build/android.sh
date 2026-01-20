#!/bin/bash
set -e


# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build apk lib/main.dart --release

firebase appdistribution:distribute './build/app/outputs/flutter-apk/app-release.apk'  \
    --app 1:696271835857:android:ab3d0a7e11d2fc7dfaabf0  \
    --release-notes "$(cat $note_file)\n $(date "+%Y-%m-%d %H:%M:%S")" \
    --groups "android"

echo '-------------------'
echo 'Build Android done'