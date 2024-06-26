project "Glad"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/glad/glad.h",
		"include/KHR/khrplatform.h",
		"src/glad.c"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter {"system:windows", "configurations:Debug"}
		runtime "Debug"
		buildoptions "/MT"
		symbols "on"

	filter {"system:windows", "configurations:Release"}
		runtime "Release"
		buildoptions "/MT"
		optimize "speed"

    filter {"system:windows", "configurations:Dist"}
		runtime "Release"
		buildoptions "/MT"
		optimize "speed"
        symbols "off"
