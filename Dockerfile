FROM python:3

LABEL "com.github.actions.name"="clang-format C++ Check"
LABEL "com.github.actions.description"="Run clang-format style check for Cpp programs."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/arvsrao/clang-format-action.git"
LABEL "homepage"="https://github.com/arvsrao/clang-format-action"
LABEL "maintainer"="arvsrao <arvsrao@gmail.com>"

RUN pip install --upgrade pip
RUN pip install clang-format

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
