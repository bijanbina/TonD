#!/bin/bash

for psfile in plot/*.ps;do
	echo $psfile
	convert "$psfile" "${psfile%.ps}.jpg"	
	rm		"$psfile"
done
