#!/bin/sh

# https://github.com/snhobbs/kicad-make/blob/0256edc46bfc10a185658dce7bf5963997f3f1dc/Makefile#L10

NAME=dc-motor-driver-adapter
DIST=dist


BOARD=board/$NAME.kicad_pcb

mkdir -p $DIST
rm -rf $DIST/*

# Gerbers: Top, Bottom, Paste (top only), Mask, Edge
mkdir -p $DIST/gerbers
kicad-cli pcb export gerbers \
    --subtract-soldermask --no-x2 --layers "F.Cu,B.Cu,Edge.Cuts,F.Paste,F.Mask,B.Mask" \
    -o $DIST/gerbers $BOARD

# Drill files: Drill, Drill map
kicad-cli pcb export drill \
    --format excellon --excellon-units mm -o $DIST/gerbers/ $BOARD

zip -rj $DIST/$NAME-gerbers.zip $DIST/gerbers/*.[gd]*
rm -rf $DIST/gerbers

cp board/docs/$NAME.txt $DIST/$NAME.txt


# Pos files: Top, Bottom
mkdir -p $DIST/assembly
kicad-cli pcb export pos \
    --format csv --units mm --side front --output $DIST/assembly/$NAME.top.pos.csv $BOARD

kicad-cli pcb export pos \
    --units mm --side front --output $DIST/assembly/$NAME.top.pos $BOARD

# kicad-cli pcb export pos \
#     --format csv --units mm --side back --output $DIST/assembly/$NAME.bottom.pos.csv $BOARD

# kicad-cli pcb export pos \
#     --units mm --side back --output $DIST/assembly/$NAME.bottom.pos $BOARD

kicad-cli sch export bom --output $DIST/assembly/$NAME.bom.csv board/6000.kicad_sch
# xsltproc -o $DIST/assembly/$NAME.bom.csv \
#     $DIST/assembly/$NAME.bom.xml

# export PYTHONPATH=$(PYTHONPATH):/usr/share/kicad/plugins/
# python3 /home/tom/.kicad/scripting/plugins/bom_html_grouped_by_value.py $< $(CURDIR)/$@

# Assembly files: Top, Bottom
# kicad-cli pcb export pdf \
#     --layers "Edge.Cuts,F.Fab" --output $DIST/assembly/$NAME.top.pdf $BOARD

# kicad-cli pcb export pdf --mirror \
#     --layers "Edge.Cuts,B.Fab" --output $DIST/assembly/$NAME.bot.pdf $BOARD


kicad-cli pcb export svg --exclude-drawing-sheet \
    --layers "Edge.Cuts,F.Fab" --output $DIST/assembly/$NAME-Top.svg $BOARD

inkscape $DIST/assembly/$NAME-Top.svg \
    --export-area-drawing --batch-process --export-type=pdf \
    --export-filename=$DIST/assembly/$NAME-Top.pdf > /dev/null 2> /dev/null

# inkscape $DIST/assembly/$NAME-Top.svg \
#     -w 1024 -D -o $DIST/assembly/$NAME-Top.png --export-background-opacity=1.0 > /dev/null 2> /dev/null

rm $DIST/assembly/$NAME-Top.svg

kicad-cli pcb export svg --exclude-drawing-sheet --mirror \
    --layers "Edge.Cuts,B.Fab" --output $DIST/assembly/$NAME-Bottom.svg $BOARD

inkscape $DIST/assembly/$NAME-Bottom.svg \
    --export-area-drawing --batch-process --export-type=pdf \
    --export-filename=$DIST/assembly/$NAME-Bottom.pdf > /dev/null 2> /dev/null

# inkscape $DIST/assembly/$NAME-Bottom.svg \
#     -w 1024 -D -o $DIST/assembly/$NAME-Bottom.png --export-background-opacity=1.0 > /dev/null 2> /dev/null

rm $DIST/assembly/$NAME-Bottom.svg

zip -rj $DIST/$NAME-assembly.zip $DIST/assembly/*
rm -rf $DIST/assembly



# Check files
mkdir -p $DIST/check

for L in F.Cu B.Cu In1.Cu In2.Cu
do

kicad-cli pcb export svg --exclude-drawing-sheet \
    --layers "Edge.Cuts,$L" --output $DIST/check/$NAME-$L.svg $BOARD

inkscape $DIST/check/$NAME-$L.svg \
    -w 1024 -D -o $DIST/check/$NAME-$L.png --export-background-opacity=1.0 > /dev/null 2> /dev/null

done

zip -rj $DIST/$NAME-check.zip $DIST/check/*
rm -rf $DIST/check

# mkdir -p $DIST/check/3dshapes
# kicad-cli pcb export vrml \
#     -o "$DIST/check/$NAME.wrl" \
#     --units mm --models-dir "3dshapes" \
#     --models-relative \
#     $BOARD
