find_file(scram_path "scram")
if(scram_path)
    execute_process(COMMAND scram tool info tensorflow-cc OUTPUT_VARIABLE SCRAM_TFCC_INFO)
    string(REGEX MATCH "\nINCLUDE=([^\n]*)" TFCC_STR ${SCRAM_TFCC_INFO})
    set(Tensorflow_INCLUDE_DIRS "${CMAKE_MATCH_1}")
    string(REGEX MATCH "\nLIBDIR=([^\n]*)" TFCC_STR ${SCRAM_TFCC_INFO})
    set(Tensorflow_LIBRARY_DIRS "${CMAKE_MATCH_1}")
    set(Tensorflow_LIBRARIES "${Tensorflow_LIBRARY_DIRS}/libtensorflow_cc.so")

    execute_process(COMMAND scram tool info tensorflow-c OUTPUT_VARIABLE SCRAM_TFC_INFO)
    string(REGEX MATCH "\nINCLUDE=([^\n]*)" TFC_STR ${SCRAM_TFC_INFO})
    list(APPEND Tensorflow_INCLUDE_DIRS ${CMAKE_MATCH_1})
    string(REGEX MATCH "\nLIBDIR=([^\n]*)" TFC_STR ${SCRAM_TFC_INFO})
    list(APPEND Tensorflow_LIBRARY_DIRS ${CMAKE_MATCH_1})
    list(APPEND Tensorflow_LIBRARIES "${CMAKE_MATCH_1}/libtensorflow.so")

    execute_process(COMMAND scram tool info protobuf OUTPUT_VARIABLE SCRAM_PB_INFO)
    string(REGEX MATCH "\nINCLUDE=([^\n]*)" PB_STR ${SCRAM_PB_INFO})
    list(APPEND Tensorflow_INCLUDE_DIRS ${CMAKE_MATCH_1})
    string(REGEX MATCH "\nLIBDIR=([^\n]*)" PB_STR ${SCRAM_PB_INFO})
    list(APPEND Tensorflow_LIBRARY_DIRS ${CMAKE_MATCH_1})
    list(APPEND Tensorflow_LIBRARIES "${CMAKE_MATCH_1}/libprotobuf.so")

    execute_process(COMMAND scram tool info Eigen OUTPUT_VARIABLE SCRAM_E_INFO)
    string(REGEX MATCH "\nINCLUDE=([^\n]*)" E_STR ${SCRAM_E_INFO})
    list(APPEND Tensorflow_INCLUDE_DIRS ${CMAKE_MATCH_1})

    message(FATAL_ERROR "Tensorflow_LIBRARIES: '${Tensorflow_LIBRARY_DIRS}'.")
else()
    #find_package(Boost REQUIRED COMPONENTS ${BoostEx_FIND_COMPONENTS})
endif()
