# Only install nvm if it's not already installed
if command -v nvm &> /dev/null; then
    echo "nvm is already installed. Skipping nvm install.";
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash;
    
    echo 'export NVM_DIR="$HOME/.nvm"' >> "$BASH_ENV";
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use' >> "$BASH_ENV";

    if grep Alpine /etc/issue > /dev/null 2>&1; then
    echo 'export NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release' >> "$BASH_ENV";
    echo 'export NVM_IOJS_ORG_MIRROR=https://example.com' >> "$BASH_ENV";
    echo 'nvm_get_arch() { nvm_echo x64-musl; }' >> "$BASH_ENV";
    fi
    
    # shellcheck source=/dev/null
    source "$BASH_ENV";
fi
