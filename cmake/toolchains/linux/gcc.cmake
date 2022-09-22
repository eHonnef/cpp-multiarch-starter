# --------------------------------------------------------------------------------
#                      GCC for Linux environment setup
# --------------------------------------------------------------------------------

set(CMAKE_AR           ${LINUX_GCC_TOOLCHAIN_PATH}gcc-ar${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_ASM_COMPILER ${LINUX_GCC_TOOLCHAIN_PATH}gcc${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_C_COMPILER   ${LINUX_GCC_TOOLCHAIN_PATH}gcc${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_CXX_COMPILER ${LINUX_GCC_TOOLCHAIN_PATH}g++${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_LINKER       ${LINUX_GCC_TOOLCHAIN_PATH}ld${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_OBJCOPY      ${LINUX_GCC_TOOLCHAIN_PATH}objcopy${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_RANLIB       ${LINUX_GCC_TOOLCHAIN_PATH}ranlib${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_SIZE         ${LINUX_GCC_TOOLCHAIN_PATH}size${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_STRIP        ${LINUX_GCC_TOOLCHAIN_PATH}strip${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_GCOV         ${LINUX_GCC_TOOLCHAIN_PATH}gcov${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")
set(CMAKE_OBJDUMP      ${LINUX_GCC_TOOLCHAIN_PATH}objdump${CMAKE_EXECUTABLE_SUFFIX} CACHE INTERNAL "")

set(CMAKE_C_FLAGS    "${EXTRA_C_FLAG}")
set(CMAKE_CXX_FLAGS  "${EXTRA_CPP_FLAG}")

set(CMAKE_C_FLAGS_DEBUG     "-O0 -g")
set(CMAKE_C_FLAGS_RELEASE   "-O3 -DNDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)