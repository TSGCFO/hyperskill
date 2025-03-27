#!/user/bin/bash

# Prompt for user input
echo "Enter a definition:"
read -a user_input

# Check if the array has exactly 2 elements (definition and constant)
if [ "${#user_input[@]}" -ne 2 ]; then
    echo "The definition is incorrect!"
    exit 0
fi

definition="${user_input[0]}"
constant="${user_input[1]}"

# Check if the definition has the correct format: unitone_to_unittwo
if [[ ! "$definition" =~ ^[a-zA-Z]+_to_[a-zA-Z]+$ ]]; then
    echo "The definition is incorrect!"
    exit 0
fi

# Check if the constant is a valid number (integer or float)
# This regex matches both integers and floats, ensuring there's at least one digit
if [[ ! "$constant" =~ ^[-+]?([0-9]+\.?[0-9]*|\.[0-9]+)$ ]]; then
    echo "The definition is incorrect!"
    exit 0
fi

# If all checks pass
echo "The definition is correct!"