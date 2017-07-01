solution "thermyte"
  location "build"
  configurations { "Debug", "Release" }

  project "nanovg"
    language "C"
    kind "StaticLib"
    includedirs { "deps/nanovg/src" }
    files { "deps/nanovg/src/*.c" }
    targetdir "build"

    configuration "Debug"
      defines { "DEBUG" }
      flags { "Symbols", "ExtraWarnings" }

    configuration "Release"
      defines { "NDEBUG" }
      flags { "OptimizeSpeed", "ExtraWarnings" }

  project "thermyte"
    kind "ConsoleApp"
    language "C"
    includedirs { "src", "deps/nanovg/src" }
    files { "src/*.c" }
    targetdir "build"
    links { "nanovg" }

    configuration "Debug"
      defines { "DEBUG" }
      flags { "Symbols", "ExtraWarnings" }

    configuration "Release"
      defines { "NDEBUG" }
      flags { "OptimizeSpeed", "Symbols", "ExtraWarnings" }

    configuration { "maxosx" }
      links { "glfw" }
      linkoptions { "-framework OpenGL", "-framework Cocoa", "-framework IOKit", "-framework CoreVideo", "-framework Carbon" }