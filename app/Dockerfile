 # --------- Build Stage ---------
FROM node:20-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy only dependency files first (for Docker cache)
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install --frozen-lockfile

# Now copy the rest of the app source code
COPY . .

# Build the production React app
RUN yarn build


# --------- Production Stage ---------
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Install 'serve' globally to serve static files
RUN npm install -g serve

# Copy only the built files from the builder stage
COPY --from=builder /app/build ./build

# Give ownership of /app to the non-root user
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Document the port the app will listen on inside the container
EXPOSE 3000

# Start the production server (same as: serve -s build -l 3000)
CMD ["serve", "-s", "build", "-l", "3000"]