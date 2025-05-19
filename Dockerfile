# Use official Node.js Alpine image
FROM node:20.11.1-alpine

# Set working directory
WORKDIR /app

# Copy dependency definitions
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy frontend source
COPY frontend ./

# Build the app
RUN npm run build

# Install static file server
RUN npm install -g serve

# Expose port
EXPOSE 3000

# Run the app
CMD ["serve", "-s", "build", "-l", "3000"]
