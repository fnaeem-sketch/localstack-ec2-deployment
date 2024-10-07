#!/bin/bash

output_file="ec2_full_output.txt"

aws --endpoint-url=http://localhost:4566 ec2 describe-instances --output table \
    --output table >> "$output_file"

echo "ec2 information has been saved to $output_file"
