#!/bin/bash

# AWS region
REGION="ap-south-1"  # Set your AWS region here

# List of instance IDs to control
INSTANCE_IDS="i-0ad5c643dd647e8a1"  # Replace with your instance IDs

# Time to run actions
STOP_HOUR=21   # 9 PM
START_HOUR=22   # 10 PM

# Get the current hour (24-hour format)
CURRENT_HOUR=$(date +%H)

# Function to stop instances
stop_instances() {
    echo "Stopping instances..."
    aws ec2 stop-instances --instance-ids $INSTANCE_IDS --region $REGION
    echo "Instances stopped."
}

# Function to start instances
start_instances() {
    echo "Starting instances..."
    aws ec2 start-instances --instance-ids $INSTANCE_IDS --region $REGION
    echo "Instances started."
}

# Determine whether to start or stop instances
if [ "$CURRENT_HOUR" -eq "$STOP_HOUR" ]; then
    stop_instances
elif [ "$CURRENT_HOUR" -eq "$START_HOUR" ]; then
    start_instances
else
    echo "No action required at this hour."
fi
