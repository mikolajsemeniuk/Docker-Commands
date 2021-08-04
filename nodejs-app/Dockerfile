# To create an image run `docker build .`
# Or `docker build -t mikolajs123/nodeapp:latest .`
# And run `docker run -p 8080:8080 {image_tag/image_name}`
# Or run `docker run -p 8080:8080 mikolajs123/nodeapp`

# Specify a base image
FROM node:alpine

# If folder won't exist would be automatically created
WORKDIR /usr/app

# Copy `index.js` and `package.json` to / of container
COPY ./ ./

# Install dependencies
RUN npm install

# Default command
CMD ["npm", "start"]