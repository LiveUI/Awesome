#/bin/bash

# Compile generator
swift build -c release

# Run generator and generate Awesome enums
./.build/release/Generator

get_latest_release() {
  curl --silent "https://api.github.com/repos/FortAwesome/Font-Awesome/releases/latest" |
  grep '"browser_download_url":' |
  grep 'web' |
  sed -E 's/.*"([^"]+)".*/\1/'
}

url="$(get_latest_release)"
echo "\nRequesting data from '$url'"
curl -L "$url" --output fontawesome-free.zip
unzip -joq ./fontawesome-free.zip -d FontAwesome

# Copy assets and enums to target directories
cp Output/Awesome.swift ../Classes/Enums
cp Output/AwesomePro.swift ../Classes/Enums

cp ./FontAwesome/*.ttf ../Assets
