FROM node:20
# Use the official Node.js 20 image as the base image
WORKDIR /app
# Set the working directory inside the container
COPY package.json ./        
# Copy package.json to the working directory
RUN npm install
# Install dependencies defined in package.json
COPY . .
# Copy the rest of the application code to the working directory
EXPOSE 3000
# Expose port 3000 for the application
CMD ["npm", "run", "dev"]
# Command to run the application in development mode using nodemon
# This assumes you have a script "dev" defined in your package.json that uses nodemon