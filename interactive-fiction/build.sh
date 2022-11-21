#!/bin/sh

dirtolower(){
#rename files all to lower case
oldIFS="$IFS"
IFS=" 
"
find . -depth | while read SRC; do
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        if [ ! -e "${DST}" ]
        then
           mv -T "${SRC}" "${DST}"
        else
           echo "${SRC} was not renamed"
        fi
    fi
done
IFS="$oldIFS"
}

if [ -f "Download/autobuilder_c_v1.sh" ]; then
autobuilder="${PWD}/Download/autobuilder_c_v1.sh"
fi

mkdir build

##cp -a Download/zoo build/
##cd build/zoo
##./autogen.sh
##./configure
##make
##cd ../../
##find Download -name "*.zoo" | while read azoo; do
##azoo="$(basename "$azoo")"
##azoo="${azoo%????}"
##mkdir "build/${azoo}"
##cd build/${azoo}
##../zoo/src/unzoo ../../Download/${azoo}.zoo
##cd ../../
##done
##find Download -name "*.sit" | while read asit; do
##asit="$(basename "$asit")"
##asit="${asit%????}"
##mkdir "build/${asit}"
##cd build/${asit}
##unar -k hidden ../../Download/${asit}.sit
##cd ../../
##done



find Download -name "*.zip" | while read azip; do
azip="$(basename "$azip")"
azip="${azip%????}"
mkdir "build/${azip}"
unzip "Download/${azip}.zip" -d "build/${azip}"
done

find Download -name "*.tar.Z" | while read atar; do
atar="$(basename "$atar")"
atar="${atar%??????}"
mkdir "build/${atar}"
cd build/${atar}
tar -xf ../../Download/${atar}.tar.Z
cd ../../
done

find Download -name "*.tar.gz" | while read atar; do
atar="$(basename "$atar")"
atar="${atar%???????}"
mkdir "build/${atar}"
cd build/${atar}
tar -xf ../../Download/${atar}.tar.gz
cd ../../
done

find Download -name "*.tgz" | while read atar; do
atar="$(basename "$atar")"
atar="${atar%????}"
mkdir "build/${atar}"
cd build/${atar}
tar -xf ../../Download/${atar}.tgz
cd ../../
done

if [ -d build ]; then

	cd build

	#build from source
	find . -name "*.exe" -exec rm -f {} \;
	find . -name "*.EXE" -exec rm -f {} \;
	find . -name "*.o" -exec rm -f {} \;
	find . -name "*.O" -exec rm -f {} \;
	find . -name "*.obj" -exec rm -f {} \;
	find . -name "*.OBJ" -exec rm {} \;

	if [ -d "adv660/adv4_src" ]; then
		echo "Building adv660"
		cd adv660/adv4_src
		gcc *.c -o adventure4
		cd ../../
	fi


	if [ -d "adv770-2.07-C-src/acode/adv770/src" ]; then
		echo "Building adv770-2.07-C-src"
		cd adv770-2.07-C-src/acode/adv770/src
		./advbuild
		cd ../../../../
	fi

	if [ -d "advent_acode/ACODE/acdc" ]; then
		echo "Building advent_acode"
		cd advent_acode/ACODE/acdc
		sed -i "s#getline#getline_internal#g" acdc.h
		sed -i "s#getline#getline_internal#g" acdc.c
		sed -i "s#getline#getline_internal#g" dominor.c
		sed -i "s#getline#getline_internal#g" domajor.c
		sed -i "s#getline#getline_internal#g" getline.c
		sed -i "s#getline#getline_internal#g" gettext.c
		sed -i "s#text_count#text_count_noredec#g" organise.c
		make

		cd ../adv550
		../acdc/acdc adv550.acd
		cp -a ../kernel/advkern.c .
		cp -a ../kernel/advkern.h .
		gcc *.c -o adv550

		cd ../adv660
		../acdc/acdc adv660.acd
		cp -a ../kernel/advkern.c .
		cp -a ../kernel/advkern.h .
		gcc *.c -o adv660

		cd ../../../
	fi

	if [ -d "Adventure2.5" ]; then
		echo "Building Adventure2.5"
		cd Adventure2.5
		sed -i "s#static quick_init#quick_init#g" init.c
		sed -i "s#static report#report#g" init.c
		sed -i "s#static quick_save#quick_save#g" init.c
		sed -i "s#static quick_io#quick_io#g" init.c
		sed -i "s#static finish_init#finish_init#g" init.c
		sed -i "s#static raw_init#raw_init#g" init.c
		gcc *.c -o adventure
		cd ..
	fi


			###This software is for QNX not *nix
			##echo "Building advqnx"
			##cd advqnx/advent/
			##make
			##cd ../../


	if [ -d "chimaera" ]; then
		echo "Building chimaera"
		cd chimaera/chimaera/
		sed -i "s#getline#getline_internal#g" chimaera.h
		sed -i "s#getline#getline_internal#g" chimaera.c
		gcc chimaera.c -lm -o chimaera
		cd ../../
	fi

	if [ -d "crystal/crystal-2.0" ]; then
		echo "Building crystal"
		cd crystal/crystal-2.0/
		./configure
		sed -i "s#getline#getline_internal#g" src/cvrdln.c
		sed -i "s#getline#getline_internal#g" src/cvspk.c
		sed -i "s#getline#getline_internal#g" src/cvsave.c
		sed -i "s# -fwritable-strings##g" Makefile.am
		sed -i "s# -fwritable-strings##g" Makefile.in
		sed -i "s# -fwritable-strings##g" Makefile
		sed -i "s# -fwritable-strings##g" src/Makefile.am
		sed -i "s# -fwritable-strings##g" src/Makefile.in
		sed -i "s# -fwritable-strings##g" src/Makefile
		make
		cd ../../
	fi

	if [ -d "dinkum-2.14/dink" ]; then
		echo "Building dinkum-2.14"
		cd dinkum-2.14/dink/
		make
		cd ../../
	fi

		##this does not build, even when linked with libglk
		##if [ -d "dungeon-glk/dungeon" ]; then
		##	echo "Building dungeon-glk"
		##	cd dungeon-glk/dungeon/
		##	sed -i "s%-I../glkterm%-I/usr/include/glktermw%g" Makefile
		##	sed -i "s%-lglkterm%-lglktermw%g" Makefile
		##	make
		##	cd ../../
		##fi

	if [ -d "dungn27s" ]; then
		echo "Building dungn27s"
		cd dungn27s
		dirtolower
		find . -type f | while read afile; do
			cat "$afile" | tr -d $'\u001A' > "$afile.new"
			rm "$afile"
			mv "$afile.new" "$afile"
		done
		make
		cd ..
	fi

		#island 26 requires dos.h
		#if [ -d "island26" ]; then
			#echo "Building island26"
			#cd island26
			#dirtolower
			#do something
			#cd ..
		#fi

	if [ -d "mansion-19.2/mansion-19.2" ]; then
		echo "Building masion-19.2"
		cd mansion-19.2/mansion-19.2/
		make
		cd ../../
	fi

	if [ -d "napoleon-1.02/napoleon-1.02" ]; then
		echo "Building napoleon-1.02"
		cd napoleon-1.02/napoleon-1.02/
		find . -type f -exec chmod +w {} \;
		sed -i "s#getline#getline_internal#g" adv.h
		sed -i "s#getline#getline_internal#g" quads.c
		sed -i "s#getline#getline_internal#g" toplev.c
		sed -i "s#getline#getline_internal#g" parse.c
		sed -i "s#getline#getline_internal#g" line.c
		sed -i "s#getline#getline_internal#g" noughts.c
		sed -i "s#getline#getline_internal#g" file.c
		sed -i "s#READLINELIB=readline/libreadline.a#READLINELIB=-lreadline#g" Makefile
		make
		cd ../../
	fi

	if [ -d "thuria" ]; then
		echo "Building thuria"
		cd thuria/
		sed -i "s#exit()#exit(0)#g" unix/src/game.c
		make
		cd ..
	fi

	if [ "$autobuilder" != "" ]; then
	#AUTOBUILD

		if [ -d "dungeon-gdt-glk/dungeon-gdt" ]; then
			echo "Building dungeon-gdt-glk"
			cd dungeon-gdt-glk/dungeon-gdt/
			CFLAGS="-I/usr/include/glktermw -DPATH_DUNDAT=${PWD}" LDFLAGS="-lglktermw" $autobuilder
			cd ../../
		fi

		if [ -d "wander" ]; then
			echo "Building wander"
			cd wander/
			sed -i "s%char    \*whatglb%char    \*whatglb =%g" wandglb.c
			sed -i "s%#define H_SCCS%#define H_SCCS =%g" wanddef.h
			sed -i "s%wrds\[MAXWRDS\]%wrds\[MAXWRDS\] =%g" wandglb.c
			sed -i "s%spvars\[\]%spvars\[\] =%g" wandglb.c
			sed -i "s%thereis\[\]%thereis\[\] =%g" wandglb.c
			sed -i "s%aansome\[\]%aansome\[\] =%g" wandglb.c
			sed -i "s%fldels\[\]%fldels\[\] =%g" wandglb.c
			sed -i "s%vardel\[\]%vardel\[\] =%g" wandglb.c
			sed -i "s%wrdels\[\]%wrdels\[\] =%g" wandglb.c
			sed -i "s%listunused\[\]%listunused\[\] =%g" wandglb.c
			$autobuilder
			cd ..
		fi

		if [ -d "worldsrc" ]; then
			echo "Building worldsrc"
			cd worldsrc/
			find . -name "*.c" -exec sed -i "s%#include \"parame.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"locdat.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"objdat.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"objdes.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"gtext.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"qtext.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"vocab.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"verbtb.inc\"%%g" {} \;
			find . -name "*.c" -exec sed -i "s%#include \"trvtbl.inc\"%%g" {} \;
			gcc vcnvrt.c -o vcnvrt
			./vcnvrt
			$autobuilder
			cd ..
		fi

		if [ -d "adv350jg" ]; then
			#this has a bsd makefile not gnu
			echo "Building adv350jg"
			cd adv350jg
			gcc -o setup setup.c
			./setup glorkz > data.c
			$autobuilder
			cd ..
		fi

		if [ -d adv350win/Adventure*/Source ]; then
			echo "Building adv350win"
			cd adv350win/Adventure*/Source
			$autobuilder
			cd ../../../
		fi

		if [ -d "adv550s" ]; then
			echo "Building adv550s"
			cd adv550s
			dirtolower
			$autobuilder
			cd ..
		fi

		if [ -d "advtc2" ]; then
			echo "Building advtc2"
			cd advtc2
			dirtolower
			find . -type f | while read afile; do
				cat "$afile" | tr -d $'\u001A' > "$afile.new"
				rm "$afile"
				mv "$afile.new" "$afile"
			done
			sed -i "s#exit()#exit(0)#g" advent.c
			sed -i "s#exit()#exit(0)#g" turn.c
			sed -i "s#extern	int	printf();##g" turn.c
			cp ../../Download/ltoa.c .
			$autobuilder
			 cd ../
		fi

		if [ -d "batlstar" ]; then
			#I get multiple definitions when attempting to build battlestar.c , which contains the main function
			echo "Building batlstar"
			cd batlstar
			dirtolower
			mv nightfil.c nightfile.c
			mv nightobj.c nightobjs.c
			mv pathname.h pathnames.h
			sed -i "s#exit()#exit(0)#g" batlstar.c
			$autobuilder
			cd ..
		fi

		if [ -d "battlestar" ]; then	
			#uses BSD makefile
			echo "Building battlestar"
			cd battlestar
			sed -i "s#exit()#exit(0)#g" battlestar.c
			$autobuilder
			cd ..
		fi

		if [ -d "advbds" ]; then
			echo "Building advbds"
			cd advbds
			dirtolower
			$autobuilder
			cd ..
		fi
	fi
fi