#!/bin/bash

PS3='Choose your favorite food: '
foods=("Pizza" "Pho" "Tacos" "Quit")
select fav in "${foods[@]}"
do
    case $fav in
        "Pizza")
            echo "Americans eat roughly 100 acres of $fav each day!"
            ;;
        "Pho")
            echo "$fav is a Vietnamese soup that is commonly mispronounced like go, instead of duh."
            ;;
        "Tacos")
            echo "According to NationalTacoDay.com, Americans are eating 4.5 billion $fav each year."
	    break
            ;;
	"Quit")
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done

