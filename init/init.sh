#!/bin/bash

#==============================================================================
# DOTFILES INITIALIZATION SCRIPT
#==============================================================================
# This script loads profile-specific configurations including aliases,
# functions, environment variables, and configurations.
#
# Usage:
#   source init.sh --profile=<profile_name> [--force]
#
# Available profiles: 2cents, bnz, linz, lotto, chesstimate, personal
#==============================================================================

#------------------------------------------------------------------------------
# GLOBAL CONFIGURATION
#------------------------------------------------------------------------------

# Define global paths
ROOTDIR="$(cd && pwd)"
DOTFILESDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Global variables
PROFILE=""
FORCE_MODE=false

#------------------------------------------------------------------------------
# FILE LOADING FUNCTIONS
#------------------------------------------------------------------------------

# Recursively walk through directory and source all files
function walk_dir() {
    local target_dir="$1"
    
    shopt -s nullglob dotglob
    
    for pathname in "$target_dir"/*; do
        if [ -d "$pathname" ]; then
            walk_dir "$pathname"
        else
            # Source readable files
            if [ -r "$pathname" ] && [ -f "$pathname" ]; then
                source "$pathname"
            fi
        fi
    done
}

# Load scripts for a specific subdirectory (utils, aliases, etc.)
function load_profile_subdir() {
    local profile_path="$1"
    local subdir="$2"
    local profile_name="$3"
    
    local full_path="${profile_path}/${subdir}"
    
    if [ -d "$full_path" ]; then
        walk_dir "$full_path"
        info "Loaded ${profile_name}/${subdir}"
    fi
}

#------------------------------------------------------------------------------
# PROFILE MANAGEMENT FUNCTIONS
#------------------------------------------------------------------------------

# Display available profiles
function show_available_profiles() {
    info "Available profiles:"
    for prof_dir in "${DOTFILESDIR}/profiles"/*; do
        if [ -d "$prof_dir" ] && [ "$(basename "$prof_dir")" != "common" ]; then
            echo "  - $(basename "$prof_dir")"
        fi
    done
}

# Display usage information
function show_usage() {
    echo ""
    error "❌ No profile was provided and only common scripts have been loaded."
    error "Please specify a profile using --profile=<profile_name>"
    echo ""
    show_available_profiles
    echo ""
    echo "Example usage:"
    echo "  source ~/.dotfiles/init/init.sh --profile=bnz"
    echo "  source ~/.dotfiles/init/init.sh --force --profile=bnz"
    echo ""
    echo "💡 Tip: Add this to your ~/.bashrc to load automatically:"
    echo "  source ~/.dotfiles/init/init.sh --force --profile=bnz"
    echo ""
}

# Load common profile scripts
function load_common_profile() {
    local common_profile="${DOTFILESDIR}/profiles/common"
    
    if [ ! -d "$common_profile" ]; then
        warning "Common profile directory not found: $common_profile"
        return 1
    fi
    
    # Load subdirectories in specific order (utils first for dependency resolution)
    local subdirs=("utils" "aliases" "configs" "envs" "functions" "secrets")
    
    for subdir in "${subdirs[@]}"; do
        load_profile_subdir "$common_profile" "$subdir" "common"
    done
    
    success "Common profile loaded"
}

# Load specific profile scripts
function load_specific_profile() {
    local profile="$1"
    local profile_lower=$(echo "$profile" | tr '[:upper:]' '[:lower:]')
    local profile_path="${DOTFILESDIR}/profiles/${profile_lower}"
    
    if [ ! -d "$profile_path" ]; then
        error ""
        error "❌ Error: Profile '$profile' not found!"
        error ""
        show_available_profiles
        return 1
    fi
    
    # Load subdirectories in specific order (utils first for dependency resolution)
    local subdirs=("utils" "aliases" "configs" "envs" "functions" "secrets")
    
    for subdir in "${subdirs[@]}"; do
        load_profile_subdir "$profile_path" "$subdir" "$profile"
    done
    
    success "Profile '$profile' loaded successfully"
}

# Main script loading function
function load_scripts() {
    local profile="$1"
    
    # Always load common profile first
    load_common_profile
    
    # Check if profile is specified
    if [ -z "$profile" ]; then
        show_usage
        return 0
    fi
    
    # Load specific profile
    load_specific_profile "$profile"
}

#------------------------------------------------------------------------------
# ARGUMENT PARSING FUNCTIONS
#------------------------------------------------------------------------------

# Display help information
function show_help() {
    echo "Dotfiles Initialization Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --profile=<name>    Specify profile to load"
    echo "  --force, -f         Skip confirmation prompt"
    echo "  --help, -h          Show this help message"
    echo ""
    show_available_profiles
    echo ""
    echo "Examples:"
    echo "  source $0 --profile=bnz"
    echo "  source $0 --force --profile=personal"
}

# Parse command line arguments
function parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --profile=*)
                PROFILE="${1#*=}"
                shift
                ;;
            --force|-f)
                FORCE_MODE=true
                shift
                ;;
            --help|-h)
                show_help
                return 0
                ;;
            *)
                error "Unknown option: $1"
                show_help
                return 1
                ;;
        esac
    done
}

# Get user confirmation for loading
function get_user_confirmation() {
    warning "This will load dotfiles and may overwrite existing configurations."
    
    if [ -n "$PROFILE" ]; then
        info "Profile: $PROFILE (+ common)"
    else
        info "Profile: None specified (only common will be loaded)"
    fi
    
    read -p "Are you sure you want to continue? (y/n) " -n 1
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        info "Operation cancelled."
        return 1
    fi
}

#------------------------------------------------------------------------------
# MAIN EXECUTION
#------------------------------------------------------------------------------

# Main function
function main() {
    # Parse command line arguments
    if ! parse_arguments "$@"; then
        return 1
    fi

    
    # Load scripts based on mode
    if [ "$FORCE_MODE" = true ]; then
        load_scripts "$PROFILE"
    else
        if get_user_confirmation; then
            load_scripts "$PROFILE"
        fi
    fi
}







echo "=========================================================="
echo "          DOTFILES INITIALIZATION SCRIPT v1.0             "
echo "=========================================================="

# Execute main function with all arguments
main "$@"