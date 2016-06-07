#!/bin/bash
echo -e "=================";
echo -e "= Code coverage =";
echo -e "=================";
echo "";

if [ "$1" != "--generate" ]; then
	./run_all.sh --coverage
fi

mv luacov.stats.out ../luacov.stats.out

cd ..

luacov -c .luacov

if [ "$1" != "--generate" ]; then


	mv -f luacov.stats.out specs/luacov.stats.out
	mv -f luacov.report.out specs/luacov.report.out

	cd specs

	if [ "$1" == "--verbose" ]; then
		cat luacov.report.out
	fi
fi