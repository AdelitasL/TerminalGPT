#!/bin/bash

function send_request() {
  curl -s https://api.openai.com/v1/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
    "model": "text-davinci-003",
    "prompt": "'"$PROMPT"'",
    "temperature": 0.5,
    "max_tokens": 2048,
    "top_p": 1,
    "frequency_penalty": 0,
    "presence_penalty": 0
  }'
}

# Check if a prompt was provided
if [ -z "$1" ]; then
  echo "Error: No prompt provided."
  echo "Usage: $0 <your prompt>"
  exit 1
fi

# Check if jq is installed
if ! command -v jq >/dev/null; then
  echo "Error: jq command not found. Please install jq to use this script."
  exit 1
fi

# Check if the OPENAI_API_KEY environment variable is set
if [ -z "$OPENAI_API_KEY" ]; then
  echo "Error: OPENAI_API_KEY environment variable not set."
  echo "Please set your OpenAI API key as an environment variable:"
  echo "export OPENAI_API_KEY=your_api_key_here"
  exit 1
fi

# Use all command-line arguments as the prompt
PROMPT="$@"

# Send the request to the OpenAI API and store the response in a variable
RESPONSE=$(send_request)

# Check for errors in the API response
if echo "$RESPONSE" | jq -e '.error' >/dev/null; then
  ERROR_MESSAGE=$(echo "$RESPONSE" | jq -r '.error.message')
  echo "Error: $ERROR_MESSAGE"
  exit 1
fi

# Extract the message from the response using jq
MESSAGE=$(echo $RESPONSE | jq -r '.choices[0].text')

# Pretty-print the message, interpreting backslash escapes and removing unwanted spaces
echo -e "$MESSAGE" | tr -s ' '
