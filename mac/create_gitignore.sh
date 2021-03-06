#!/bin/sh

create_gitignore() {
    # argv length check
    if [ -z $1 ]; then
        echo 'Usage: git_ignore arg1 arg2 arg3 ...'
        return
    fi

    # overwrite check
    flag='y'
    if [ -e '.gitignore' ]; then
        printf 'Are you overwrite .gitignore ? [y/N]: '
        read flag;
    fi

    # download .gitignore
    if [ $flag = 'y' ]; then
        s=$(echo $@ | tr ' ' ',')
        curl -f https://gitignore.io/api/$s -o .gitignore
        echo "create .ignore file for: ${s}"
    fi
    echo 'finish.'
}
create_gitignore $@
