#!/bin/bash

head -n 2 em.gro

export resname="POPE"


for i in {1..50}
do
	for atom in $(cat POPE.itp);
	do
		string1="$i$resname" 
		string2="$atom"
		grep -e "\b$string1" em.gro | grep -e "\b$string2\b"
	done
done


export resname="DMD"


for i in {35..45}
do
	for atom in $(cat DMD.itp);
	do
		string1="$i$resname" 
		string2="$atom"
		
		atomcharmm=`grep -e "DMD$atom\b" dmd_map.txt | awk '{print $2}'`
		#echo $atomcharmm

		grep -e "\b$string1" em.gro | grep -e "\b$atomcharmm\b" | awk '{print substr($0,1,10) v substr($0,15)}' v=$atom

	done
done


export resname="TIP3"

for i in {1..1500}
do
	string1="$i$resname" 
	grep -e "\b$string1" em.gro
	
done

tail -n 1 em.gro
