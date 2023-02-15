#!/bin/bash
# ------------------------------------------------------------------
# [Author] Niles Hacking (nhacking@sensoryinc.com)
# [Title] Objective C cloud SDK helper script
# ------------------------------------------------------------------

USAGE="Usage: ./sc.sh [COMMAND]"

COMMANDS="
    Commands:\n
    genproto | gp\t\t Generate Proto Files\n
    help | h\t\t Display This Help Message\n
"

print_helper() {
  echo
  echo ${USAGE}
  echo
  echo -e ${COMMANDS}
}

# --- Options Processing -------------------------------------------
if [ $# == 0 ] ; then
    print_helper
    exit 1;
fi

# --- Vars ---------------------------------------------------------
PROTO_PATH='./proto'
GEN_PATH='./objc-sdk/Generated'
PROTOC_PATH='./Example/Pods/!ProtoCompiler'
PLUGIN='./Example/Pods/!ProtoCompiler-gRPCPlugin/grpc_objective_c_plugin'
DESCRIPTOR_FILE="${PROTOC_PATH}/google/protobuf/descriptor.proto"

# --- Helper Functions ---------------------------------------------

gen_proto() {
  rm -rf ${GEN_PATH}
  mkdir -p ${GEN_PATH}

  # Compile everything in the ./proto directory
  for x in $(find ${PROTO_PATH} -iname "*.proto");
  do
    ${PROTOC_PATH}/protoc \
      --plugin=protoc-gen-grpc=${PLUGIN} \
      --proto_path=${PROTO_PATH} \
      --proto_path=${PROTOC_PATH} \
      --objc_out=${GEN_PATH} \
      --grpc_out=${GEN_PATH} \
      $x;
  done

  # Manually compile the descriptor.proto file since validator.proto depends on it
  ${PROTOC_PATH}/protoc \
    --objc_out=${GEN_PATH} \
    --proto_path=${PROTOC_PATH} \
    ${DESCRIPTOR_FILE};
}

# Fixes the import paths in the generated protobuf files
fix_proto() {
  for x in $(find ${GEN_PATH} -iname "*.pb*");
  do
    sed -i '' 's:"\([a-zA-Z1-9]*/\)*\([a-zA-Z]*.pbobjc.h\)":"\2":g' $x
    sed -i '' 's:"\([a-zA-Z1-9]*/\)*\([a-zA-Z]*.pbrpc.h\)":"\2":g' $x
  done
}

# --- Body ---------------------------------------------------------
case "$1" in

  "genproto"|"gp")
    gen_proto
    fix_proto
    exit 0;
    ;;

  "help"|"h")
    print_helper
    exit 0;
    ;;

  *)
    print_helper
    exit 1;
    ;;

esac
