#! /bin/sh

VER_MAJOR=1
VER_MINOR=2
UUID1=326ad7a9-8639-407f-b054-ea9d9f60297c
UUID2=a8d31dc4-bfbd-4a3d-b220-c06effd49654

RESOURCE_PACK_NAME=EndermanStopGriefing

RESOURCE_PACK_FILE_JAVA=${RESOURCE_PACK_NAME}.zip

TMPDIR=./tmp

#
# for Java Edition
#
TEXTURES_SRCDIR=${RESOURCE_PACK_NAME}/data/minecraft/tags/blocks
TEXTURES_DSTDIR=${TMPDIR}/data/minecraft/tags/blocks
PACK_FORMAT=22
rm -f ${RESOURCE_PACK_FILE_JAVA}
rm -f -r ${TMPDIR}
mkdir -p ${TMPDIR} ${TMPDIR}/data
mkdir -p ${TMPDIR}/data/minecraft ${TMPDIR}/data/minecraft/tags ${TMPDIR}/data/minecraft/tags/blocks
cp ${TEXTURES_SRCDIR}/enderman_holdable.json ${TEXTURES_DSTDIR}/enderman_holdable.json
cp -R ${RESOURCE_PACK_NAME}/pack.png ${TMPDIR}/
cat ${RESOURCE_PACK_NAME}/pack.mcmeta | \
sed "s/XXXPACKFORMATXXX/${PACK_FORMAT}/g" | \
sed "s/XXXMAJORXXX/${VER_MAJOR}/g" | \
sed "s/XXXMINORXXX/${VER_MINOR}/g" | \
sed "s/XXXUUID1XXX/${UUID1}/g" | \
sed "s/XXXUUID2XXX/${UUID2}/g" | \
cat > ${TMPDIR}/pack.mcmeta
(cd ${TMPDIR}/ && zip -r ../${RESOURCE_PACK_FILE_JAVA} *)
rm -f -r ${TMPDIR}
