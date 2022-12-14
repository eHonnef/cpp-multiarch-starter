cmake_minimum_required(VERSION 3.14)

# List all files containing tests.
file(GLOB_RECURSE TEST_SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/*.cpp")

set(TEST_MAIN unit_tests)   # Default name for test executable (change if you wish).
set(TEST_RUNNER_PARAMS "")  # Any arguemnts to feed the test runner (change as needed).

# --------------------------------------------------------------------------------
#                         Make Tests (no change needed).
# --------------------------------------------------------------------------------
add_executable(${TEST_MAIN} ${TEST_SOURCES})
target_link_libraries(${TEST_MAIN} PRIVATE ${USER_GENERATED_LIB} doctest)
set_target_properties(${TEST_MAIN} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
target_set_warnings(${TEST_MAIN} ENABLE ALL AS_ERROR ALL DISABLE Annoying) # Set warnings (if needed).

add_test(
  # Use some per-module/project prefix so that it is easier to run only tests for this module
  NAME ${PROJECT_NAME}.${TEST_MAIN}
  COMMAND ${TEST_MAIN} ${TEST_RUNNER_PARAMS}
)

# Adds a 'coverage' target.
include(CodeCoverage)
