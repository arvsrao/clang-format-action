#!/usr/bin/env bash

# Accepts a filepath argument. The filepath passed to this function must point
# to a .cpp or .h file. The file is formatted with clang-format-9 and that output is
# compared to the original file.
format_diff(){
    local filepath="$1"
    local_format="$(clang-format-9 --style=file --fallback-style=LLVM "${filepath}")"
    diff -q <(cat "${filepath}") <(echo "${local_format}") > /dev/null
    diff_result="$?"
    if [[ "${diff_result}" -ne 0 ]]; then
    	echo "${filepath} is NOT formatted correctly." >&2
    	return 1;
    fi
    echo "${filepath} is correctly formatted."
    return 0;
}

cd "$GITHUB_WORKSPACE" || exit 1

# All files improperly formatted will be printed to the output.
acc=0;

files=$(find . -regextype posix-extended  -regex '.*.(h|cpp)')
for f in $files; do
    format_diff $f
    acc=$((acc + $?))
done

#for i in {1..5}; do ((acc++)); done
if [[ $acc -ne 0 ]]; then
    echo $acc "file(s) NOT properly formatted."
    exit 1;
fi
exit 0;
