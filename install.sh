#!/bin/bash

tar xvfz ifuah.tar.gz
direc=/usr/share/texlive/texmf-dist/tex/latex/

if [ ! -e $direc ]
then
	echo $direc directory not found. Please insert the directory where the package has to be installed
	read direc
fi

if [ ! -e $direc/ifuah ]
then
	mv ifuah $direc
else
	mv ifuah/* $direc/ifuah
fi

chmod 644 /usr/share/texlive/texmf-dist/tex/latex/ifuah/*
chmod 755 /usr/share/texlive/texmf-dist/tex/latex/ifuah

texhash
