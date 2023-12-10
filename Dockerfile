# Use the official Node.js 14 image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that Nuxt.js dev server will run on
EXPOSE 3000

# Start the Nuxt.js dev server
CMD ["npm", "run", "dev"]
