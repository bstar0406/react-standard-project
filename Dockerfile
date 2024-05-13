# Use an official Node runtime as the base image
FROM node:21

# Set the working directory in the container to /app
WORKDIR /src

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install -g pnpm

# Install any needed packages specified in package.json
RUN npm install -g pm2

# Install any needed packages specified in package.json
RUN pnpm install

# Bundle app source inside Docker image 
COPY . .

# Make port 5173 available to the world outside the container
EXPOSE 5173

# Run the app when the container launches
CMD ["pnpm", "dev"]