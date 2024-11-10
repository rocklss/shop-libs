# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg apt-transport-https software-properties-common xdg-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Git PPA to install Git 2.28.0 or higher
RUN add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y git

# Install Node.js 18.x (compatible with Shopify CLI requirements)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install Shopify CLI
RUN npm install -g @shopify/cli@latest

# Verify versions (Node.js >= 18.20, Git >= 2.28.0)
RUN node -v && git --version && shopify version

# Copy the script into the container
COPY theme-dev.sh /app/theme-dev.sh

# Make the script executable
RUN chmod +x /app/theme-dev.sh

# Set up a working directory
WORKDIR /app

# Set up your entry point to access the CLI
ENTRYPOINT ["/bin/bash"]