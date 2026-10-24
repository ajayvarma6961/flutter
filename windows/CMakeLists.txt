cmake_minimum_required(VERSION 3.14)
project(goodwork LANGUAGES CXX)

set(BINARY_NAME "goodwork")

cmake_policy(SET CMP0069 NEW)
set(CMAKE_POLICY_DEFAULT_CMP0069 NEW)

add_executable(${BINARY_NAME} WIN32
  "runner/main.cpp"
  "runner/flutter_window.cpp"
)

target_compile_features(${BINARY_NAME} PRIVATE cxx_std_17)
