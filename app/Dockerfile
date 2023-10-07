# Build
FROM oven/bun:1.0.4-slim as build
WORKDIR /app
COPY package.json .
COPY bun.lockb .
RUN bun install

COPY . .
RUN bun run build

# Run
FROM node:18.18.0-slim
WORKDIR /app
ENV PORT=3000
COPY --from=build /app/.output /app/.output
# Optional, only needed if you rely on unbundled dependencies
# COPY --from=build /src/node_modules /src/node_modules
CMD [ "node", ".output/server/index.mjs" ]