# TerminalGPT

This script sends a prompt to the OpenAI API and receives a response using the text-davinci-003 model.

## Prerequisites

- [jq](https://stedolan.github.io/jq/) command-line JSON processor

## Installation

### Step 1: Install jq

#### macOS

Using Homebrew:

```bash
brew install jq
```

#### Ubuntu / Debian

```bash
sudo apt-get update && sudo apt-get install jq
```

#### CentOS / Fedora / RHEL
```bash
sudo yum install jq
```

### Step 2: Set up the script

1. Place the TerminalGPT.sh script in a directory of your choice.
2. Make the script executable:
```bash
chmod +x /path/to/your/openai_request.sh
```
Replace /path/to/your/ with the actual path to the directory containing the TerminalGPT.sh script.

### Step 3: Configure your shell
1. Open your shell's configuration file:
For Bash: ~/.bashrc
For Zsh: ~/.zshrc
2. Add the following lines at the end of the file:
```bash
# OpenAI TerminalGPT Script
alias chat="/path/to/your/openai_request.sh"
export OPENAI_API_KEY="your_api_key_here"
```
Replace /path/to/your/ with the actual path to the directory containing the openai_request.sh script, and your_api_key_here with your actual OpenAI API key.

3. Save the file and close the editor.
4. Reload the shell's configuration file:
For Bash: source ~/.bashrc
For Zsh: source ~/.zshrc

### Usage
To use the script, simply call the chat alias followed by your prompt:
```
chat How are you today?
```
The script will send the prompt to the OpenAI API and display the message in the terminal.
