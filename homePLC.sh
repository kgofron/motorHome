#!/bin/bash

SERVO=( 701 702 703 704 711 712 713 714 )
TIMER=( 5511 5512 5611 5612 5711 5712 5811 5812 )
PLC=( 8 9 10 11 12 13 14 15 )
# AXIS=(1, 2, 3, 4, 5, 6, 7, 8 )

folder=DIR
rm -rf $folder
mkdir $folder
for AXIS in {1..8}
# for i in {1..8}
do 
#    echo "Welcome $axis"
#    mkdir $axis 
#    echo ${PLC[$AXIS]}
    
    cp -f -r templates $folder/$AXIS 
#    echo "$folder/$AXIS"
    for fl in $folder/$AXIS/*
    do
#	echo $fl
	sed -i "s/\$(AXIS)/$AXIS/g" $fl

	TMP=${PLC[$AXIS-1]}
#	echo $TMP
	sed -i "s/\$(PLC)/$TMP/g" $fl

	TMP=${SERVO[$AXIS-1]}
	sed -i "s/\$(SERVO)/$TMP/g" $fl

	TMP=${TIMER[$AXIS-1]}
	sed -i "s/\$(TIMER)/$TMP/g" $fl
    done
done

#for fl in templates/*; do
#cp $fl $fl.8
#sed -i 's/$(PLC)/8/g' $fl.8 
#done
