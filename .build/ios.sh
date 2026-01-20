#!/bin/bash
set -e

# Đường dẫn đến tệp tin txt chứa nội dung ghi chú
note_file=".build/note.txt"

fvm flutter build ipa --release --export-method ad-hoc

firebase appdistribution:distribute './build/ios/ipa/hiloca.ipa' \
    --app 1:696271835857:ios:21e51f4ec8c2e2cefaabf0 \
    --release-notes "$(cat $note_file)\n $(date "+%Y-%m-%d %H:%M:%S")" \
    --groups "ios"

echo '-------------------'
echo 'Build IOS done'