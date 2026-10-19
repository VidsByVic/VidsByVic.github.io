#!/usr/bin/env bash
# One-time copy of Victor's own images/files from the old Wix site into this repo.
set -e
mkdir -p images files
W=https://static.wixstatic.com/media
get(){ curl -fsSL "$1" -o "$2" && echo "ok $2"; }
get "$W/006df8_f446f4e81c2849fa822e3e7a0107452e~mv2.png" images/logo.png
get "$W/cca785_18e25582b1754d4cb768563211d2c71f~mv2.png" images/hero.png
cp images/hero.png images/og.png
get "$W/cca785_965c6c413185484e97f5b13f6124715e~mv2.png" images/corporate.png
get "$W/cca785_51eb1790425440dc8af7744c419c7b1c~mv2.png" images/nonprofit.png
get "$W/cca785_c2b7bef922e241928b7f37f9fa39d981~mv2.png" images/family.png
get "$W/cca785_cc6220d56f4045108179f93ae7bed6dc~mv2.png" images/proposals.png
get "$W/006df8_9af80f94ff864f1cb86b711b30f3369e~mv2.png" images/reload.png
get "$W/006df8_e9aa7563105d410c926da901e0e9818c~mv2.png" images/nj1015.png
get "$W/006df8_34477569853846fb88f3d17882924ea9~mv2.png" images/exceed.png
get "$W/006df8_c4837b338e8c4ba68b08fbda917fea86~mv2.png" images/millennium.png
get "https://www.vidsbyvic.com/_files/ugd/cca785_5c8e9b2b9ecf4a0aaf89b8afc01eafeb.pdf" files/millennium-inc.pdf
# Shrink the big banners to fast-loading JPGs
sudo apt-get -qq install -y imagemagick >/dev/null 2>&1 || true
for n in corporate nonprofit family proposals; do
  convert images/$n.png -resize '1800x>' -quality 82 images/$n.jpg && rm images/$n.png && echo "shrunk $n"
done
