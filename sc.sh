#!/bin/bash
# ------------------------------------------------------------------
# [Author] Niles Hacking (nhacking@sensoryinc.com)
# [Title] Objective C cloud SDK helper script
# ------------------------------------------------------------------

USAGE="Usage: ./sc.sh [COMMAND]"

COMMANDS="
    Commands:\n
    genproto | gp\t\t Generate Proto Files\n
    release | rv [version]\t Releases and tags the SDK\n
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
GEN_PATH='./SensoryCloud/Generated'
PROTOC_PATH='./Example/Pods/!ProtoCompiler'
PLUGIN='./Example/Pods/!ProtoCompiler-gRPCPlugin/grpc_objective_c_plugin'
DESCRIPTOR_FILE="${PROTOC_PATH}/google/protobuf/descriptor.proto"

# --- Helper Functions ---------------------------------------------

gen_proto() {
  # Delete previously generated files
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

fix_proto() {
  # Fixes the import paths in the generated files
  for x in $(find ${GEN_PATH} -iname "*.pb*");
  do
    sed -i '' 's:"\([a-zA-Z1-9]*/\)*\([a-zA-Z]*.pbobjc.h\)":"\2":g' $x
    sed -i '' 's:"\([a-zA-Z1-9]*/\)*\([a-zA-Z]*.pbrpc.h\)":"\2":g' $x
  done

  # Flattens the generated files down into a single directory and cleans up the empty directories
  find ${GEN_PATH} -mindepth 2 -type f -exec mv {} ${GEN_PATH} \;
  find ${GEN_PATH} -type d -empty -delete
}

release_version() {
  version=$1
  regex_version='^[0-9]+\.[0-9]+\.[0-9]+$'

  if [[ ! ${version} =~ ${regex_version} ]]; then
    echo "Version string should be of the format {Major}.{Minor}.{Trivial} ex: 1.2.3"
    exit 1
  fi

  # Check if version exists
  git fetch --tags
  if [ $(git tag -l "${version}") ]; then
    echo "Version ${version} already exists. Exiting."
    exit 1
  fi

  git add *
  git commit -am "Release [${version}]"
  git tag ${version}
  git push --atomic origin HEAD ${version}

  echo "Linting podspec file, this takes a few minutes..."
  pod spec lint SensoryCloud.podspec --allow-warnings
  echo "Releasing to Cocoapods, this also takes a few minutes..."
  pod trunk push SensoryCloud.podspec --allow-warnings
}

# --- Body ---------------------------------------------------------
case "$1" in

  "genproto"|"gp")
    gen_proto
    fix_proto
    exit 0;
    ;;

  "release"|"rv")
    if [[ $# -ne 2 ]]; then
        echo "Please supply a version string in the format {Major}.{Minor}.{Trivial} ex: 1.2.3"
        exit 1;
    fi

    echo "Have you manually bumped the version numbers in \`SensoryCloud.podspec\` and \`README.md\`? "
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) release_version $2; break;;
            No ) exit 1;;
        esac
    done

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
