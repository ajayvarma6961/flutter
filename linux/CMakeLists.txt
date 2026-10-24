cmake_minimum_required(VERSION 3.10)
project(runner LANGUAGES CXX)

set(BINARY_NAME "goodwork")
set(APPLICATION_ID "com.example.goodwork")

cmake_policy(SET CMP0063 NEW)

set(CMAKE_INSTALL_RPATH "$ORIGIN/lib")

# Configure build options.
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Flutter build mode" FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Profile" "Release")
endif()

# Compilation flags that can be applied to all targets.
add_compile_options(-Wall -Werror)

# List of application sources.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
)

# Apply the standard set of build settings.
set_target_properties(${BINARY_NAME} PROPERTIES
  CXX_STANDARD 14
  CXX_STANDARD_REQUIRED ON
  CXX_VISIBILITY_PRESET hidden
)

target_compile_definitions(${BINARY_NAME} PRIVATE
  APPLICATION_ID="${APPLICATION_ID}"
)
