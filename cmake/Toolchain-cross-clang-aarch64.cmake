# https://cmake.org/Wiki/CMake_Cross_Compiling
set(CMAKE_CROSSCOMPILING TRUE)

# the name of the target operating system
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(triple aarch64-w64-windows-gnu)

#set(CMAKE_${lang}_COMPILE_OPTIONS_SYSROOT "--sysroot=")
SET(CMAKE_SYSROOT /clangarm64)
SET(Qt5_DIR /clangarm64/lib/cmake/Qt5)

set(ENV{PKG_CONFIG_DIR} "")
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_SYSROOT}/usr/lib/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig")
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})
# which compilers to use for C and C++
set(CMAKE_C_COMPILER clang)
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CXX_COMPILER_TARGET ${triple})
find_program(PKG_CONFIG_EXECUTABLE pkg-config-cross)

# pkg-config
#find_program(PKG_CONFIG_EXECUTABLE NAMES ${COMPILER_PREFIX}-pkg-config)

# here is the target environment located
#SET(CMAKE_FIND_ROOT_PATH /usr/${COMPILER_PREFIX}/sys-root/mingw)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment

SET(CMAKE_FIND_ROOT_PATH /clangarm64)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

message("---------------------lo")