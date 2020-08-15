#!/usr/bin/env bash
pushd _scripts_
./premake5 --file=gts_sln.lua vs2015 msvc
./premake5 --file=gts_sln.lua vs2017 msvc
./premake5 --file=gts_sln.lua vs2015 clang
./premake5 --file=gts_sln.lua vs2017 clang
./premake5 --file=gts_sln.lua xcode4
./premake5 --file=gts_sln.lua gmake
popd