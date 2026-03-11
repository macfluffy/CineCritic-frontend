# Stage 1: Build the application with a clean install
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

# Stage 2: Build and run the application
# For speed optimization purposes, we'll do a clean 
# install of the dependencies first, then copy over 
# the remaining files
# FROM node:24 AS production

# WORKDIR /app

# COPY --from=builder /app/node_modules ./node_modules

# Copy the remaining files
COPY . .

# Create the application user and assign the default
# user when opening the application as basicUser for
# security purposes
# RUN groupadd application-users && useradd basic-user -G application-users
# USER basic-user

# Map and open up port 5173 to allow outside
# access to the containerised application
# ENV PORT=5173
EXPOSE 5173

# Start the server and establish connection to 
# the internet gateway
CMD ["npm", "run", "dev"]