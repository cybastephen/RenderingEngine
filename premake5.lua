workspace "RenderingEngine"
    architecture "x64"
    configurations 
    { 
        "Debug",
        "Release"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    IncludeDir = {}
    IncludeDir["GLFW"] = "RenderingEngine/vendor/GLFW/include"
    IncludeDir["Glad"] = "RenderingEngine/vendor/Glad/include"
    IncludeDir["ImGui"] = "RenderingEngine/vendor/ImGui"

    include "RenderingEngine/vendor/GLFW"
    include "RenderingEngine/vendor/Glad"
    include "RenderingEngine/vendor/ImGui"

project "RenderingEngine"
    location "RenderingEngine"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{prj.name}/vendor/spdlog/include"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} ../Sandbox")
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

    filter "configurations:Debug"

    filter "configurations:Release"
    optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "RenderingEngine/vendor/spdlog/include",
        "RenderingEngine/src"
    }

    links
    {
        "RenderingEngine"
    }

    filter "system:windows"
    cppdialect "C++17"
    systemversion "latest"

filter "configurations:Debug"

filter "configurations:Release"
optimize "On"