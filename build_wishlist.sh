#!/usr/bin/env bash

# Shamelessly copying Veritas1000's wishlist builder script
# https://github.com/Veritas1000/dim-wish-list-sources

BUILT_WISHLIST_FILE="choosy_craigmink.txt"
BUILT_WISHLIST_TITLE="A compiled wishlist generated from sublists"

MKB=false
CONTROLLER=true
INCLUDE_TRASH=false

add_sublist() {
    echo "Adding $1"

    echo "// source file: $1" >> $BUILT_WISHLIST_FILE
    cat $1 >> $BUILT_WISHLIST_FILE
    echo "" >> $BUILT_WISHLIST_FILE
}

echo "Combining sublists into ${BUILT_WISHLIST_FILE}:"

echo "title: ${BUILT_WISHLIST_TITLE}" > $BUILT_WISHLIST_FILE
echo "" >> $BUILT_WISHLIST_FILE

# craigmink's lists
for sublist in `ls craigmink/*.txt | sort -V`;do
    add_sublist "$sublist"
done

add_sublist "choosy_voltron.txt"


#Panda's lists
# for sublist in PandaPaxxy/*.txt;do
#     if [[ $sublist == *"controller"* && "$CONTROLLER" = false ]] \
#         || [[ $sublist == *"mkb"* && "$MKB" = false ]]
#     then
#         echo "-- SKIPPING $sublist"
#     else
#         add_sublist $sublist
#     fi
# done

# Mercules904's lists
# for sublist in Mercules904/*.txt;do
#     add_sublist $sublist
# done

# AyyItsChevy's lists
# for sublist in AyyItsChevy/*.txt;do
#     add_sublist $sublist
# done

# if [ "$INCLUDE_TRASH" = true ];then
#     for sublist in "$(ls -1 */*trash*.txt | sort -r)";do
#         add_sublist "$sublist"
#     done
# fi