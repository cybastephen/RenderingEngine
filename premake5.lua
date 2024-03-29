workspace "RenderingEngine"
    architecture "x64"
    configurations 
    { 
        "Debug",
        "Release"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "RenderingEngine"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "%{prj.name}")

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

    filter "configurations:Debug"

    filter "configurations:Release"
    optimize "On"

