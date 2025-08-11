FROM node:15
# Use the official Node.js 15 image as the base image
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
CMD ["node", "index.js"]
# Command to run the application
# You can also use `npm start` if you have a start script defined in package.json
# For example, if you have "start": "node index.js" in your package.json you can replace the CMD line with: CMD ["npm", "start"]
# This will run the start script defined in package.json
# Ensure your application listens on port 3000 for it to be accessible from outside the container