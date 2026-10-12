#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$HOME/flutter"
export PATH="$HOME/flutter/bin:$PATH"

flutter config --enable-web
flutter pub get
flutter build web --release
