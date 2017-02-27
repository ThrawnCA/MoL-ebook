#!/bin/sh

DIR=`dirname $0`
ARTIFACT="$DIR/Mother of Learning.epub"
mkdir $DIR/OEBPS_tmp
for file in `ls $DIR/OEBPS/*`; do
  sed 's|\s\s\s*| |g' $file | tr -d '\n' > `echo $file | sed 's|/OEBPS/|/OEBPS_tmp/|'`
done
mv $DIR/OEBPS $DIR/OEBPS_orig
mv $DIR/OEBPS_tmp $DIR/OEBPS
rm "$ARTIFACT"
zip -r "$ARTIFACT" $DIR/META-INF $DIR/OEBPS $DIR/mimetype
rm -r $DIR/OEBPS
mv $DIR/OEBPS_orig $DIR/OEBPS
