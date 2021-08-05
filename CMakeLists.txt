cmake_minimum_required(VERSION 3.15)
project(openaoe)

set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(deps/glfw)

add_executable(openae)
target_sources(openae PRIVATE src/main.cpp)
target_sources(openae PRIVATE deps/glad/src/gl.c)

target_include_directories(openae PRIVATE "deps/glfw/include")
target_include_directories(openae PRIVATE "deps/glad/include")
target_include_directories(openae PRIVATE "deps/glm")
target_link_libraries(openae glfw ${GLFW_LIBRARIES})