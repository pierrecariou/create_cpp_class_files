#!/bin/bash

INC=0

if [ $1 ]
then
	MAJ=$(echo $1 | tr a-z A-Z)
else
	exit $?
fi

#Creating hpp file...

echo "#ifndef ${MAJ}_HPP
# define ${MAJ}_HPP

# include <string>
# include <iostream>

class $1 {
	public:" > $1.hpp

echo -n	"		${1}" >> $1.hpp

if [ $# -gt 1 ]
then
	echo -n "(" >> $1.hpp
	for var in "$@"
	do
		if [ $INC -gt 0 ]
		then
			ARR=(${var//#/ })
			if [ $INC -gt 1 ]
			then
				echo -n ", " >> $1.hpp
			fi
				echo -n "${ARR[0]} ${ARR[1]}" >> $1.hpp
		fi
		let "INC++"
	done
	echo ");" >> $1.hpp
else
	echo "(void);" >> $1.hpp
fi

echo	"		~${1}(void);" >> $1.hpp

INC=0

if [ $# -gt 1 ]
then
	for var in "$@"
	do
		if [ $INC -gt 0 ]
		then
			ARR=(${var//#/ })
			ARG1=${ARR[1]}
			LETTER=$(echo ${ARG1:0:1} | tr a-z A-Z)
			CAMELCASE=$(echo -n $LETTER ; echo ${ARR[1]} | cut -c 2-) 
			echo "		${ARR[0]} get${CAMELCASE}(void);" >> $1.hpp
		fi
		let "INC++"
	done
	echo >> $1.hpp
	echo "	private:" >> $1.hpp 
	INC=0
	for var in "$@"
	do
		if [ $INC -gt 0 ]
		then
			ARR=(${var//#/ })
			echo "		${ARR[0]} ${ARR[1]};" >> $1.hpp
		fi
		let "INC++"
	done
fi

echo "};

#endif" >> $1.hpp
echo "$1.hpp created"

#Creating cpp file...

echo "#include "$1.hpp"

$1::$1(std::string name, std::string color, std::string state)
{
	this->name = name;
	this->color = color;
	this->state = state;
	std::cout << "created" << std::endl;
	return ;
}

$1::~$1(void)
{
	std::cout << "delete" << std::endl;
	return ;
}

std::string	$1::getName(void)
{
	return this->name;
}

std::string	$1::getColor(void)
{
	return this->color;
}

std::string	$1::getState(void)
{
	return this->state;
}" > $1.cpp
echo "$1.cpp created"
