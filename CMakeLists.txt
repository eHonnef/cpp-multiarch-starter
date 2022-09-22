# --------------------------------------------------------------------------------
#                      Main CMakeLists file
# --------------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.22)

# Check if this is the main file or a subproject
set(MAIN_PROJECT OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(MAIN_PROJECT ON)

  # Set the C++ standard and if you are using the C++ extensions
  set(CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS ON)
  set(CMAKE_CXX_STANDARD 20)
  set(CMAKE_C_STANDARD 99)

  message("This is the main project folder")
endif()

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
include(ConfigSafeGuards)
include(Sanitizers)
include(Environment)
include(FetchContent)

project(
  cpp-multiarch-starter  # Project name
  VERSION 1.2.3.4        # Project version
  LANGUAGES CXX C ASM    # Project language
)

# Some includes must be after the project definition
include(Warnings)
include(Documentation)
include(LTO)
include(Misc)
include(Doctest)

# Check for LTO support.
if (${ENABLE_LTO})
  find_lto(CXX C ASM)
endif()

# --------------------------------------------------------------------------------
#                         Locate files
# --------------------------------------------------------------------------------
# User source files
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

# --------------------------------------------------------------------------------
#                            Build!
# --------------------------------------------------------------------------------
set(USER_GENERATED_LIB ${PROJECT_NAME}_USER_LIB)

add_library(${USER_GENERATED_LIB} OBJECT ${SOURCES})
target_include_directories(${USER_GENERATED_LIB} PUBLIC
  "include"
)

# --------------------------------------------------------------------------------
#                            External dependencies
# --------------------------------------------------------------------------------
# <Change> the cmake/FetchExternal.cmake file
# Including all external deps
include(FetchExternal)

# Linking external deps
target_link_libraries(${USER_GENERATED_LIB} INTERFACE ${lst_external})

# Include 3rd party
add_subdirectory(thirdparty)

# Link libraries (this should be available for every one)
target_link_libraries(${USER_GENERATED_LIB} PUBLIC 3RD_PARTY_LIBS)

# --------------------------------------------------------------------------------
#                            Compiling tests
# --------------------------------------------------------------------------------
if(${ENABLE_DOCTESTS})
  target_link_libraries(${USER_GENERATED_LIB} PRIVATE doctest)
  add_subdirectory(tests)
endif()

# --------------------------------------------------------------------------------
#                            Compiling options
# --------------------------------------------------------------------------------
# Set the compile options you want.
# <Change> the cmake/Warnings.cmake file if you want to add/remove/enable/disable some warnings.
target_set_warnings(${USER_GENERATED_LIB} ENABLE ALL AS_ERROR ALL DISABLE Annoying)

#------------------------------------------------------------------------------------------------------------
#                            Compiling main files
# --------------------------------------------------------------------------------
add_subdirectory(app)
