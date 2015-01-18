#!/bin/bash

parse_git_branch()
{
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo ${ref#refs/heads/}
}

branch=$(parse_git_branch)

git format-patch origin/${branch} --src-prefix=llvm_${branch}/projects/libcxx/ --dst-prefix=macports_${branch}/projects/libcxx/ --start-number=3000
