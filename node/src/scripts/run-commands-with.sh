source "$BASH_ENV";

if command -v nvm &> /dev/null; then
    if [ -f ".nvmrc" ]; then
        NVMRC_SPECIFIED_VERSION=$(<.nvmrc)
        nvm install "$NVMRC_SPECIFIED_VERSION"
        nvm use
    fi
fi

if [[ "$ORB_PARAM_PKG_MANAGER" == "npm" ]]; then
    npm run "$ORB_PARAM_NPM_RUN"
else
    yarn run "$ORB_PARAM_YARN_RUN"
fi