configure_file(
    "${CMAKE_SOURCE_DIR}/cmake/ENCRYPTO_utils.CMakeLists.txt.in"
    "${CMAKE_CURRENT_BINARY_DIR}/ENCRYPTO_utils.CMakeLists.txt"
    @ONLY
)

ExternalProject_Add(ENCRYPTO_utils
    DEPENDS MIRACL
    SOURCE_DIR "${PROJECT_SOURCE_DIR}/extern/ENCRYPTO_utils"
    INSTALL_DIR "${Project_INSTALL_PREFIX}"
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_CURRENT_BINARY_DIR}/ENCRYPTO_utils.CMakeLists.txt"
        "<SOURCE_DIR>/CMakeLists.txt"
    COMMAND "${PROJECT_SOURCE_DIR}/cmake/patch-ENCRYPTO_utils.sh" "<SOURCE_DIR>"
    CMAKE_ARGS
        -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
        -DCMAKE_CXX_COMPILER:PATH=${CMAKE_CXX_COMPILER}
        -DCMAKE_C_COMPILER:PATH=${CMAKE_C_COMPILER}
)