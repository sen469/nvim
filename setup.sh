#!/bin/bash

CURRENT_DIR=$(pwd)
SOURCE_FILE="${CURRENT_DIR}/.vimrc"

TARGET_FILE="${HOME}/.vimrc"

if [ -f "$SOURCE_FILE" ]; then
    ln -sf "$SOURCE_FILE" "$TARGET_FILE"
    echo "シンボリックリンクを作成しました: ${TARGET_FILE} -> ${SOURCE_FILE}"
else
    echo "エラー: カレントディレクトリに .vimrc が見つかりません。"
    exit 1
fi
