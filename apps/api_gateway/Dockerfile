FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY apps/api_gateway/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY apps/api_gateway/src ./src

# Build the application
RUN npm run build

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["node", "dist/main.js"]