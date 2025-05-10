# Bash completion for DVM (Deck Version Manager)

# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__dvm_init_completion()
{
    COMPREPLY=()
    # Check if _get_comp_words_by_ref exists, if not, use basic approach
    if declare -F _get_comp_words_by_ref >/dev/null 2>&1; then
        _get_comp_words_by_ref "$@" cur prev words cword
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        cword=$COMP_CWORD
        # Note: removing 'words' assignment as it's not used
    fi
}

_dvm() {
    local cur prev cword commands
    # Use _init_completion if available, otherwise use our fallback
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion -s || return
    else
        __dvm_init_completion -n "=" || return
    fi

    commands="list-remote list install install-use uninstall use current help"

    if [[ $cword -eq 1 ]]; then
        # Complete command - using mapfile to avoid SC2207
        mapfile -t COMPREPLY < <(compgen -W "${commands}" -- "${cur}")
        return 0
    fi

    # Command-specific completions
    case "${prev}" in
        install|install-use|use|uninstall)
            # For version-related commands, get installed versions
            local dvm_dir="${HOME}/.dvm"
            local versions=""
            
            if [[ -d "${dvm_dir}/versions" ]]; then
                versions=$(ls -1 "${dvm_dir}/versions" 2>/dev/null)
            fi
            
            # Using mapfile to avoid SC2207
            mapfile -t COMPREPLY < <(compgen -W "${versions}" -- "${cur}")
            return 0
            ;;
        list-remote)
            # For list-remote, suggest numbers 1-5
            # Using mapfile to avoid SC2207
            mapfile -t COMPREPLY < <(compgen -W "1 2 3 4 5" -- "${cur}")
            return 0
            ;;
        *)
            # No specific completion for other commands
            return 0
            ;;
    esac
}

complete -F _dvm dvm
