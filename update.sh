#!/bin/bash
set -e
git pull origin master
DEPENDENCY="coffee-react-transform"
VERSION=`npm view ${DEPENDENCY} version`
echo "updating to $VERSION"
npm install --save "${DEPENDENCY}@${VERSION}"
EXECJS_RUNTIME=Node bundle exec rake test_runtime
git commit -a -m "updated ${DEPENDENCY} to v${VERSION}"
npm version $VERSION
read -p "will publish $VERSION. are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  bundle exec rake release
  git push origin master
  git push origin --tags
fi