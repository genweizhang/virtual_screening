LINE=`awk "NR==$1" $SEEDFILE`
LIGSOURCE=`echo $LINE | awk '{split($0,array,":")} END{print array[1]}'`
DOCKINGPATH=`echo $LINE | awk '{split($0,array,":")} END{print array[2]}'`
LIGFILE=`basename $LIGSOURCE`
LIGNAME=`basename $LIGFILE .pdbqt`
DOCKLOG=${LIGNAME}.log
DOCKED_LIGAND=${LIGNAME}_out.pdbqt
mkdir -p $DOCKINGPATH 
cd $DOCKINGPATH 
touch $STATUS

echo "Current ligand ID is: $LIGNAME"
/home/genweizhang/raccoon/bin/vina --config "$CONFIG" --ligand "$LIGSOURCE" --out "$DOCKED_LIGAND" --log "$DOCKLOG" 
echo " "
echo " "

echo $DOCKINGPATH/$DOCKED_LIGAND >> $STATUS
