if(ON AND ${MAIN_PROJECT}) # Enable (ON) or disable (OFF) this main file compilation
  set(EXECUTABLE_NAME "main")     # Name of the executable file
  set(MAIN_FILE_PATH "main.cpp")  # Location of the file containing the main function

  # Add an executable for the main files app/main.cpp.
  add_executable(${EXECUTABLE_NAME} ${MAIN_FILE_PATH})

  # Link the executable to library.
  target_link_libraries(${EXECUTABLE_NAME} PRIVATE ${USER_GENERATED_LIB})

  # Set warnings.
  target_set_warnings(${EXECUTABLE_NAME} ENABLE ALL AS_ERROR ALL DISABLE Annoying)

  # enable link-time-optimization if available for non-debug configurations (enable/disable at Environment.cmake)
  if (${ENABLE_LTO})
    target_enable_lto(main optimized) 
  endif()

  # --------------------------------------------------------------------------------
  #                            Post compile commands
  # --------------------------------------------------------------------------------
  add_custom_command(TARGET ${EXECUTABLE_NAME} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_HOME_DIRECTORY}/LICENSE $<TARGET_FILE_DIR:${EXECUTABLE_NAME}>)
endif()
