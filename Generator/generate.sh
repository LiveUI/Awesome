#/bin/bash

# Compile generator
swift build

# Run generator and generate Awesome enums
# TODO: Retrieve this path from the output of "swift build"
./.build/x86_64-apple-macosx10.10/debug/Generator

# Download FontAwesome Free assets
# TODO: Find newest version number
curl https://use.fontawesome.com/releases/v5.1.0/fontawesome-free-5.1.0-web.zip --output fontawesome-free.zip
unzip -joq ./fontawesome-free.zip -d FontAwesome

# Copy assets and enums to target directories
cp Output/Awesome.swift ../Classes/Enums
cp Output/AwesomePro.swift ../Classes/Enums

cp ./FontAwesome/*.ttf ../Assets
