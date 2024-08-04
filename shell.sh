#!/bin/bash


# Ask for package manager
echo "What is your package manager?"
echo "1. pacman (Arch)"
echo "2. apt (Debian)"
echo "3. dnf (Red Hat)"
read -p "Enter the number of your package manager: " pm_choice

# Install zoxide based on package manager choice
case $pm_choice in
    1)
        sudo pacman -S zoxide neofetch starship
        ;;
    2)
        sudo apt update && sudo apt install zoxide neofetch
        curl -sS https://starship.rs/install.sh | sh
        ;;
    3)
        sudo dnf install zoxide neofetch
        curl -sS https://starship.rs/install.sh | sh
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
starship preset plain-text-symbols -o ~/.config/starship.toml
# Ask for shell
echo "What is your shell?"
echo "1. fish"
echo "2. zsh"
echo "3. bash"
read -p "Enter the number of your shell: " shell_choice

# Modify shell config based on choice
case $shell_choice in
    1)
        echo 'neofetch' >> ~/.config/fish/config.fish
        echo 'zoxide init fish | source' >> ~/.config/fish/config.fish
        echo 'starship init fish | source' >> ~/.config/fish/config.fish
        ;;
    2)
        echo 'neofetch' >> ~/.zshrc
        echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
        echo 'eval "$(starship init zsh)"' >> ~/.zshrc
        ;;
    3)
        echo 'neofetch' >> ~/.bashrc
        echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Setup complete!"