-- premake5.lua

workspace "Template-Project"
  architecture "x64"
  configurations { "Debug", "Release" }

  outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

  project "Project-1"
    location "Project-1"
    kind "ConsoleApp"
    language "C++"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
      "%{prj.name}/src/**.h",
      "%{prj.name}/src/**.cpp"
    }

    includedirs {
      "%{prj.name}/vendor/glad/include",
      "%{prj.name}/vendor/glfw/include"
    }

    -- GLAD 
    files {
      "%{prj.name}/vendor/glad/src/glad.c",
    }
  
    filter "system:linux"
      links { "GL", "glfw", "dl" , "X11", "pthread" }

    filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"
    
    filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"


