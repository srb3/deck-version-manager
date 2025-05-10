#compdef dvm
# Zsh completion for DVM (Deck Version Manager)

_dvm() {
    local curcontext="$curcontext" state line
    typeset -A opt_args

    _arguments -C \
        '1: :->command' \
        '*: :->args'

    case $state in
        command)
            _values 'command' \
                'list-remote[List available deck versions]' \
                'list[List installed deck versions]' \
                'install[Install a specific deck version]' \
                'install-use[Install and use a specific deck version]' \
                'uninstall[Uninstall a specific deck version]' \
                'use[Set a specific deck version as current]' \
                'current[Show the current deck version]' \
                'help[Show help message]'
            ;;
        args)
            case ${line[1]} in
                list-remote)
                    # Suggest page numbers 1-5
                    _values 'pages' 1 2 3 4 5
                    ;;
                install|install-use)
                    # For install commands, try to use cached versions
                    local dvm_dir="${HOME}/.dvm"
                    local cache_file="${dvm_dir}/remote_versions_cache"
                    local versions
                    
                    if [[ -f "${cache_file}" && $(($(date +%s) - $(stat -c %Y "${cache_file}" 2>/dev/null || stat -f %m "${cache_file}" 2>/dev/null))) -lt 86400 ]]; then
                        # Cache is less than 24 hours old, use it
                        IFS=$'\n' versions=($(cat "${cache_file}"))
                        _values 'version' "${versions[@]}"
                    else
                        # Fall back to installed versions
                        if [[ -d "${dvm_dir}/versions" ]]; then
                            IFS=$'\n' versions=($(ls -1 "${dvm_dir}/versions" 2>/dev/null))
                            _values 'version' "${versions[@]}"
                        fi
                    fi
                    ;;
                use|uninstall)
                    # For use/uninstall, only suggest installed versions
                    local dvm_dir="${HOME}/.dvm"
                    
                    if [[ -d "${dvm_dir}/versions" ]]; then
                        local versions
                        IFS=$'\n' versions=($(ls -1 "${dvm_dir}/versions" 2>/dev/null))
                        _values 'version' "${versions[@]}"
                    fi
                    ;;
            esac
            ;;
    esac
}

_dvm "$@"
