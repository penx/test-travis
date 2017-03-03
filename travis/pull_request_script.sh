# Fail pull request if there's already a tag for this version
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")
GIT_TAG=v$PACKAGE_VERSION
GIT_TAG_REMOTE=$(git ls-remote --tags origin $GIT_TAG)
if [[ -z $GIT_TAG_REMOTE ]]; then return 1; else return 0; fi
