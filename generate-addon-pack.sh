#!/bin/bash

ADDON_PACK_TMPDIR="addon-pack-tmpdir"

echo "Heavily WIP, aborting for security reasons!" && exit

cp -rp upstream $ADDON_PACK_TMPDIR
cd $ADDON_PACK_TMPDIR
for i in `find . -type f`; do
	if test -f ../base/$i; then
		echo "Deduplicating shaderfile $i..."  
		rm $i
	fi
done
echo "Cleaning up empty directories"
find . -type d -empty -delete

echo "Finished creating $ADDON_PACK_TMPDIR, now compressing it..."
zip -r9 "../shaders-`date +%Y%m%d`.dat" *
cd ..

echo "Removing temporary directory..."
rm -rf "$ADDON_PACK_TMPDIR"
echo "Done!"
