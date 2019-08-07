#!/bin/bash

# set -x
seedFile=${1:-seed.img}

dataFiles="user-data meta-data"

for f in ${dataFiles}
do
 [ -f $f ] && { echo $f found; cpFiles="${cpFiles} $f"; }
done

[ -z "${cpFiles}" ] && { 
 echo "No Files! at least one of ${dataFiles} must exist"
 exit 1
}

tmpImg=$(mktemp tmpLB.XXXXXXXXXX)
tmpMnt=$(mktemp -d tmpMP.XXXXXXXXXX)

dd if=/dev/zero of=${tmpImg} bs=1M count=10  >/dev/null 2>&1
mkfs -t vfat -n cidata ${tmpImg}  > /dev/null

mount ${tmpImg} ${tmpMnt}
cp ${cpFiles} ${tmpMnt} 
sync
umount ${tmpMnt}

rmdir ${tmpMnt}
mv --force ${tmpImg} ${seedFile}
echo "seed file ${seedFile} generated OK"

