# Use a lightweight Nginx image as base
FROM nginx:alpine

# Copy the application files into the container
COPY . /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx server when the container starts
CMD ["nginx", "-g", "daemon off;"]
