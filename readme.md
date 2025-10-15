# Dotfiles
A *profile-based*, modular, and idempotent dotfiles setup for quickly configuring new environments. Features a sophisticated profile system that allows you to load environment-specific configurations while maintaining common shared settings.

This is truly more about the journey than the destination!

## 🚀 Quick Start

### Installation
1. Clone this repository into your desired location:
   ```bash
   git clone https://github.com/Mansour-J/.dotfiles.git ~/.dotfiles
   ```

2. Navigate to the dotfiles directory:
   ```bash
   cd ~/.dotfiles/init
   ```

3. Load a specific profile:
   ```bash
   # Interactive mode with confirmation
   ./init.sh --profile=bnz
   
   # Force mode (no confirmation)
   ./init.sh --force --profile=bnz
   ```


### Adding to Shell Profile
Add one of the following to your shell profile (~/.bashrc, ~/.zshrc, etc.):

```bash
# Load specific profile automatically
source ~/.dotfiles/init/init.sh --force --profile=bnz

# Or load interactively when needed
alias load-dotfiles='~/.dotfiles/init/init.sh'
```

## 📁 Profile-Based Architecture

### Available Profiles
- **common**: Base configurations loaded for all profiles
- **bnz**: Bank of New Zealand specific configurations
- **2cents**: 2cents project configurations  
- **linz**: Linz project configurations
- **lotto**: Lotto project configurations
- **chesstimate**: Chesstimate project configurations
- **personal**: Personal development configurations

### Profile Structure

Each profile contains the following modular components:
```
profiles/
├── common/              # Always loaded first
│   ├── aliases/         # Common command aliases
│   ├── configs/         # Shared configuration files
│   ├── envs/           # Common environment variables
│   ├── functions/      # Shared utility functions
│   ├── secrets/        # Common secrets (git-ignored)
│   └── utils/          # Shared utility scripts
│
└── [profile-name]/     # Profile-specific configurations
    ├── aliases/        # Profile-specific aliases
    ├── configs/        # Profile configurations
    ├── envs/          # Profile environment variables
    ├── functions/     # Profile-specific functions
    ├── secrets/       # Profile secrets (git-ignored)
    └── utils/         # Profile utility scripts
```
## 🎯 Usage Examples

> 🚨🚨🚨 Never load it like `./.dotfiles/init/init.sh --profile=bnz` because it executes, it does not source and will forget what was executed.

### Loading Profiles

```bash
# Load BNZ profile (common + bnz configs)
source ~/.dotfiles/init/init.sh --profile=bnz

# Load personal profile with force flag
source ~/.dotfiles/init/init.sh --force --profile=bnz

# Case insensitive - all work the same
source ~/.dotfiles/init/init.sh --force --profile=BNZ
source ~/.dotfiles/init/init.sh --force --profile=bnz
source ~/.dotfiles/init/init.sh --force --profile=Bnz
```

## Error Handling

### No profile specified
```bash
source ~/.dotfiles/init/init.sh

# ❌ Error: No profile was provided and only common scripts have been loaded.
# Please specify a profile using --profile=<profile_name>
```

### Invalid profile
```bash
source ~/.dotfiles/init/init.sh --profile=invalid

# ❌ Error: Profile 'invalid' not found!
# Available profiles: 2cents, bnz, linz, lotto, chesstimate, personal
```

## ✨ Features

- **🎯 Profile-Based Loading**: Load only what you need for each project/environment
- **🔄 Always Load Common**: Shared configurations loaded automatically
- **🛡️ Error Handling**: Clear messages for missing profiles or invalid usage
- **📝 Case Insensitive**: Profile names work regardless of case
- **🚀 Force Mode**: Skip confirmations for automated setups
- **🔒 Secrets Management**: Git-ignored secrets directories in each profile
- **📦 Modular Design**: Each component type has its own directory
- **🎨 Colorized Output**: Clear visual feedback during loading
- **⚡ Idempotent**: Safe to run multiple times

## 🔒 Security

- **secrets/** directories are automatically git-ignored
- Each profile can have its own isolated secrets
- Common secrets are shared across all profiles
- SSH keys, tokens, and sensitive configs are kept separate

## 📚 Articles & References

- [Shell Startup Scripts](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
- [Bash/Zsh Startup Files Loading Order](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/)
- [Mathias Bynens Dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Thoughtbot Dotfiles](https://github.com/thoughtbot/dotfiles)
- [Dotfiles Community](https://dotfiles.github.io/)
- [Encrypted Dotfiles](https://abdullah.today/encrypted-dotfiles/)
- [Environment Variables Guide](https://www3.ntu.edu.sg/home/ehchua/programming/howto/Environment_Variables.html#zz-2.1)
- [ANSI Escape Codes](https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html)

## Enhancements and Improvements

- [ ] **Environment Isolation**: When setting a new profile, ensure previous profile envs are cleared and only new profile is sourced
- [ ] **Configuration Validation**: Add validation checks for profile configurations before loading
- [ ] **Cross-Platform Support**: Enhance Windows and macOS compatibility
- [ ] **Profile Templates**: Add template generation for creating new profiles quickly

## 🐛 Issues

Found a bug or have an idea for improvement? We'd love to hear from you!

- **Report Issues**: [Open a GitHub Issue](https://github.com/Mansour-J/.dotfiles/issues) to report bugs, request features, or ask questions
- **Contribute**: Feel free to open a Pull Request with your improvements - we'll get it merged!
- **Discussion**: Use GitHub Issues for general discussion about dotfiles management and best practices

All contributions are welcome, whether it's:
- 🐛 Bug fixes
- ✨ New features or profiles
- 📚 Documentation improvements
- 🎨 Code cleanup and optimization

## 💬 Support

Using this dotfiles template? Support this effort by:
- ⭐ **Giving a star** on [GitHub](https://github.com/Mansour-J/.dotfiles)
- 📝 **Sharing your experience** in a blog post
- 🐦 **Giving a shoutout** on Twitter
- 🤝 **Contributing back** with improvements

Your feedback and contributions help make this project better for everyone!