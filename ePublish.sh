#!/bin/sh

DIR=`dirname $0`
mkdir $DIR/OEBPS_tmp
for file in `ls $DIR/OEBPS/*.*ml`; do
  cat $file | tr -d '\n' > `echo $file | sed 's|/OEBPS/|/OEBPS_tmp/|'`
done
mv $DIR/OEBPS $DIR/OEBPS_orig
mv $DIR/OEBPS_tmp $DIR/OEBPS
zip -r $DIR/"Mother of Learning.epub" $DIR/META-INF $DIR/OEBPS $DIR/mimetype
rm -r $DIR/OEBPS
mv $DIR/OEBPS_orig $DIR/OEBPS
