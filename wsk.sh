#!/usr/bin/env bash

function print_help {
    function print_help {
    echo "\

Commands:

build       build...
link        link...
help        prints this message
\
"
}
}

function build {
    echo "build..."
}

function link {
    echo "link..."
}

argv=$1

if [$argv = "build"]
    build
fi

if [$argv = "link"]
    link
fi
