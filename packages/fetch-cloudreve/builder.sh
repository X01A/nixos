source $stdenv/setup

set -o noglob

mkdir download
cd download

cloudreve-cli share:download $share /$shareFile

fl=$(basename $shareFile)
unpackFile $fl
rm -f $fl
ls -lah
mv $(pwd) $out
runHook postFetch
set +o noglob
exit 0
