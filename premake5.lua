workspace "RenderingEngine"
    architecture "x64"
    configurations 
    { 
        "Debug",
        "Release"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    IncludeDir = {}
    IncludeDir["GLFW"] = "vendor/GLFW/include"

    include "vendor/GLFW"

project "RenderingEngine"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "%{prj.name}")

    files
    {
        "%{src/**.h}",
        "%{src/**.cpp}"
    }

    includekdirs
    {
        "%src",
        "%{includeDir.GLFW}"
    }

    links
    {
        "GLFW"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

    filter "configurations:Debug"

    filter "configurations:Release"
    optimize "On"

