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
    IncludeDir["Glad"] = "vendor/Glad/include"
    IncludeDir["ImGui"] = "vendor/ImGui"

    include "vendor/GLFW"
    include "vendor/GLad"
    include "vendor/ImGui"

project "RenderingEngine"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp"
    }

    includedirs
    {
        "src/",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "vendor/spdlog/include"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

    filter "configurations:Debug"

    filter "configurations:Release"
    optimize "On"

