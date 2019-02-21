#!/bin/bash
base=`basename $1 .PNG`
pnm=${base}.pnm
ydim=`file $1 |  awk '{print $7}' | sed 's/,/ /g'`
echo $pnm $ydim
factor=`echo "640/" $ydim | bc -l`
#echo $pnm $ydim $factor
pngtopnm $1 > $pnm
pnmscale $factor $pnm > ${pnm}.scaled
pnmtopng  ${pnm}.scaled > ${1}.scaled.PNG

