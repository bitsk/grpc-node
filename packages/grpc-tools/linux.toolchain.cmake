IF(UNIX AND NOT APPLE)
    SET(CMAKE_COMPILER_PREFIX "")

    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -static -Wl,-Bstatic")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static -Wl,-Bstatic")
    SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static -Wl,-Bstatic")

    IF(GRPC_TOOLS_TARGET STREQUAL "x86_64")
        SET(CMAKE_COMPILER_PREFIX "x86_64-linux-gnu-")

        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m64")
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m64")
        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m64")
    ENDIF()
    
    IF(GRPC_TOOLS_TARGET STREQUAL "i686")
        SET(CMAKE_COMPILER_PREFIX "i686-linux-gnu-")

        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")
    ENDIF()
    
    IF(GRPC_TOOLS_TARGET STREQUAL "aarch64")
        SET(CMAKE_COMPILER_PREFIX "aarch64-linux-gnu-")
    ENDIF()

    IF(GRPC_TOOLS_TARGET STREQUAL "riscv64")
        SET(CMAKE_COMPILER_PREFIX "riscv64-linux-gnu-")
    ENDIF()

    SET(CMAKE_C_COMPILER "${CMAKE_COMPILER_PREFIX}gcc")
    SET(CMAKE_CXX_COMPILER "${CMAKE_COMPILER_PREFIX}g++")
ELSE()
    MESSAGE(WARNING "OS is not linux, not setting variables.")
ENDIF()
