# --------------------------------------------------------------------------------
#                      SANITIZERS
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
#                      Clearing variables
# --------------------------------------------------------------------------------
# Bug when crosscompiling with cmake: https://stackoverflow.com/a/10599472
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
set(CMAKE_EXE_LINKER_FLAGS "")
set(CMAKE_SHARED_LINKER_FLAGS "")
set(CMAKE_C_FLAGS "")
set(CMAKE_CXX_FLAGS "")

# --------------------------------------------------------------------------------
#                      Options
# --------------------------------------------------------------------------------
option(USE_ASAN "Use address sanitizer" OFF)
option(USE_LSAN "Use leak sanitizer" OFF)
option(USE_UBSAN "Use undefined behavior sanitizer" OFF)
option(SANITIZER_DISABLE_FORTIFY "Disable _SOURCE_FORTIFY definition" OFF)
option(SANITIZER_DISABLE_OPTIMIZATION "Disable optimizations" OFF)

macro (enable_sanitizers)
  if (USE_ASAN)
    message(STATUS "Enabling address sanitizer")
    set(ASAN_FLAGS          "-fsanitize=address -fno-omit-frame-pointer -fsanitize-address-use-after-scope")
  endif ()
  if (USE_LSAN)
    message(STATUS "Enabling leak sanitizer")
    set(LSAN_FLAGS          "-fsanitize=leak -fno-omit-frame-pointer")
  endif ()
  if (USE_UBSAN)
    message(STATUS "Enabling undefined behavior sanitizer")
    set(UBSAN_FLAGS         "-fsanitize=undefined -fno-sanitize-recover=all")
  endif ()

  set(SANITIZER_FLAGS         "${LSAN_FLAGS} ${ASAN_FLAGS} ${UBSAN_FLAGS}")
  set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS} ${SANITIZER_FLAGS}")
  set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${SANITIZER_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${SANITIZER_FLAGS}")

  if (SANITIZER_DISABLE_FORTIFY)
    set(CMAKE_C_FLAGS       "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE")
    set(CMAKE_CXX_FLAGS     "${CMAKE_CXX_FLAGS} -U_FORTIFY_SOURCE")
  endif ()
  if (SANITIZER_DISABLE_OPTIMIZATION)
    set(CMAKE_C_FLAGS       "${CMAKE_C_FLAGS} -g -O0")
    set(CMAKE_CXX_FLAGS     "${CMAKE_CXX_FLAGS} -g -O0")
  endif ()
endmacro()
