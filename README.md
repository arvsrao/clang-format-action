# clang-format-action
GitHub Action for clang-format

This action checks C++ files (`.cpp` and `.h`) in `test/`, `/include`, and `src/` directories of a CMake project. On any push to the repo the aforementioned file types, in the GitHub workspace, are formatted inside an ubuntu docker container with `clang-format-9` and compared.

The action returns the number of incorrectly formatted files.

* SUCCESS: zero exit-code if project `.cpp` and `.h` files are formatted correctly
* FAILURE: nonzero exit-code if project C files are not formatted correctly

Define desired formatting rules in a .clang-format file at the repository root. Otherwise, the LLVM style guide is used as a default. Mine is based on google's style.
# Usage

To use this action, create a `.github/workflows/clang-format-check.yml` in the target repository containing:

```
name: clang-format
on:
  push:
    paths-ignore:
    - 'resources/**'
    - 'README.md'

jobs:
  formatting-check:
    name: Formatting Check
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run clang-format style check for cpp programs.
      uses: arvsrao/clang-format-action@master
```
