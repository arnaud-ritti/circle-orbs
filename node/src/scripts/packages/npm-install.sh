source "$BASH_ENV";

if command -v nvm &> /dev/null; then
    if [ -f ".nvmrc" ]; then
        NVMRC_SPECIFIED_VERSION=$(<.nvmrc)
        nvm install "$NVMRC_SPECIFIED_VERSION"
        nvm use
    fi
fi

# Configure npm cache path if provided
if [[ -n "$PARAM_CACHE_PATH" ]]; then
    npm config set cache "$PARAM_CACHE_PATH"
fi

# Run override ci command if provided, otherwise run default npm install
if [[ -n "$PARAM_OVERRIDE_COMMAND" ]]; then
    echo "Running override package installation command:"
    eval "$PARAM_OVERRIDE_COMMAND"
else
    npm ci
fi