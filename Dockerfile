# Build the application with a clean install
# of the dependencies.
# Current stable version of Node: v24.11.1
FROM node:24 AS builder

# Set the working directory to /app
WORKDIR /app

# Copy the list of dependencies into /app
COPY package*.json ./

# Perform a clean install of all our production 
# dependencies. Vite is required to run the 
# application, devdependencies needed.
RUN npm install

# Copy the remaining files
COPY . .

# Map and open up port 5173 to allow outside
# access to the containerised application
# ENV PORT=5173
EXPOSE 5173

# Start the server and establish connection to 
# the internet gateway
CMD ["npm", "run", "dev"]