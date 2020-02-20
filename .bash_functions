# vim: ft=sh

function lll() {
    ls -lA --color=always $* | less -RNSJFX
}

function llal() {
    ls -la --color=always $* | less -RNSJFX
}
