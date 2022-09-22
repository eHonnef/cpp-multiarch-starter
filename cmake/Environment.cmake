# --------------------------------------------------------------------------------
#                      Environment setup
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
#                         Options
# --------------------------------------------------------------------------------
# <Change>
# Options: Enable or disable as you wish
# Allow target_set_warnings to add flags and defines.
# Set this to OFF if you want to provide your own warning parameters.
set(ENABLE_WARNINGS_SETTINGS ON)
# Enable link time optimization
set(ENABLE_LTO OFF)
# Include tests in the library. Setting this to OFF will remove all doctest related code.
set(ENABLE_DOCTESTS OFF)
# Enable multithreading (@todo)
set(ENABLE_THREADS OFF)
# Generate doxygen pages?
set(GENERATE_DOXYGEN OFF)
# Use the config file? (Config.h.in)
set(USE_CONFIG_FILE OFF)

# --------------------------------------------------------------------------------
#                         Toolchain locations
# --------------------------------------------------------------------------------
# Example: set(BAREMETAL_ARM_TOOLCHAIN_PATH "/opt/toolchains/gcc-arm-11.2-2022.02-x86_64-arm-none-eabi/bin/")
set(BAREMETAL_ARM_TOOLCHAIN_PATH "")
set(LINUX_GCC_TOOLCHAIN_PATH "")

# --------------------------------------------------------------------------------
#                      Additional flags and definitions
# --------------------------------------------------------------------------------
# <change> CPU related flag, comment/remove if not relevant
# Example: set(CPU_FLAG "-mcpu=cortex-m7 -mfpu=fpv4-sp-d16 -mfloat-abi=hard")
set(CPU_FLAG "")
# <change> Extra flags for both C and C++ compilers
set(EXTRA_COMMON_COMPILER_FLAGS "${CPU_FLAG}")
# <change> Extra flags for C compiler
set(EXTRA_C_FLAG "${EXTRA_COMMON_COMPILER_FLAGS}")
# <change> Extra flags for C++ compiler
set(EXTRA_CPP_FLAG "${EXTRA_COMMON_COMPILER_FLAGS} -Wno-register -fno-rtti")

# <change> Compiler definitions
# Example: add_definitions(-DUSING_OS_FREERTOS)

# --------------------------------------------------------------------------------
#                      Linker options and flags
# --------------------------------------------------------------------------------
# <change> Location of the linker file
set(LINKER_FILE "")

# <change> Additional flags
set(LINKER_EXTRA_FLAGS "")

# --------------------------------------------------------------------------------
#                         Platform setup
# --------------------------------------------------------------------------------
if (NOT DEFINED PLATFORM)
  set(DEFAULT_PLATFORM linux)
  message(STATUS "'PLATFORM' is not defined. Using '${DEFAULT_PLATFORM}'")
  set(PLATFORM ${DEFAULT_PLATFORM})
endif ()

# Setup platform toolchain file.
include(${CMAKE_CURRENT_LIST_DIR}/toolchains/${PLATFORM}/${TOOLCHAIN})
