# clang-format-action
GitHub Action for clang-format

This action checks C++ files (.cpp and .h) in test/, /include, and src/ directories of a CMake project. The GitHub workspace are formatted correctly using the [precompiled Python wheel](https://pypi.org/project/clang-format/) for `clang-format`.

The action returns:

* SUCCESS: zero exit-code if project C files are formatted correctly
* FAILURE: nonzero exit-code if project C files are not formatted correctly

Define desired formatting rules in a .clang-format file at the repository root. Otherwise, the LLVM style guide is used as a default. Mine is based on google's sstyle.
# Usage

To use this action, create a `.github/workflows/clang-format-check.yml` in the target repository containing:

```
name: clang-format Check
on: [push]
jobs:
  formatting-check:
    name: Formatting Check
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run clang-format style check for C programs.
      uses: jidicula/clang-format-action@master
```
