-- premake5.lua

workspace "gts"
    configurations { "Debug", "RelWithAssert", "Release" }
    platforms { "x64" }
    location ("../../../lib/GTS-GameTaskScheduler/" .. _ACTION .. (_ARGS[1] and ("/" .. _ARGS[1]) or ("")))
    startproject "gts"
    
    warnings "Extra"
    
    if(_ARGS[1] == "clang") then
        toolset "msc-llvm-vs2014"
    else
        flags "FatalWarnings"
    end
    
    filter { "platforms:x64"}
        architecture "x86_64"
        
    filter { "action:vs*" }        
        defines { "_HAS_EXCEPTIONS=0" }
        buildoptions "/EHsc"
        
    filter { "action:gmake" }
        buildoptions "-pedantic -fno-exceptions"
        
    filter { "action:xcode4" }
        buildoptions "-pedantic -fno-exceptions"
       
    filter {"configurations:Debug"}
        defines { "_DEBUG" }
        symbols "On"

    filter { "configurations:RelWithDebInfo" }
        defines { "NDEBUG", "GTS_USE_FATAL_ASSERT" }
        symbols "On"
        optimize "Full"

    filter { "configurations:Release" }
        defines { "NDEBUG" }
        symbols "On"
        optimize "Full"
 
    include "_intermediates_/gts"