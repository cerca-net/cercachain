#!/bin/bash

# Find .env files
find . -name "*.env*" | tee env_files.txt

# Find used environment variables
grep -r "process.env" | tee used_env_variables.txt

# Find Dockerfiles
find . -name "Dockerfile" | tee dockerfiles.txt

# Check Express middleware usage
grep -r "app.use(" | tee express_middlewares.txt

# Check Auth0 integration
grep -r "Auth0" | tee auth0_integration.txt

# Check Supabase integration
grep -r "Supabase" | tee supabase_integration.txt

# Check EdgeFunction integration
grep -r "EdgeFunction" | tee edge_function_integration.txt

echo "Script execution completed. Check the output files."