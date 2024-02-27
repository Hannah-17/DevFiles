function tr() {
	git add -u
}

function gb() {
	git branch | grep "*" | cut -d ' ' -f2
}

function gco() {
    local BRANCH=$(gb);
    local FUNCTION=$1;
    local COMMENT="${@:2}";
    git commit -m "$FUNCTION: $BRANCH: $COMMENT"
}
