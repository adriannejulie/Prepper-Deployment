#!/bin/bash

# Start the Spring backend
echo "Starting Spring backend..."
cd back-end  # Navigate to the backend directory
mvn spring-boot:run &  # Run the Spring application in the background
BACKEND_PID=$!  # Save the process ID of the backend

# Wait for a moment for the backend to start up
sleep 20  # Adjust the sleep duration as necessary

# Start the React frontend
echo "Starting React frontend..."
cd ../fron_tend/REACT-APP  # Navigate to the frontend directory
npm install  # Install frontend dependencies
npm start &  # Start the React development server in the background
FRONTEND_PID=$!  # Save the process ID of the frontend

# Wait for both processes to finish
wait $BACKEND_PID
wait $FRONTEND_PID
