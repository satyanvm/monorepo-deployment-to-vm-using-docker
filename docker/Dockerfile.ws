FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./bun.lock  ./bun.lock

COPY ./package.json  ./package.json
COPY  ./turbo.json  ./turbo.json

COPY ./apps/backend-ws  ./apps/backend-ws

RUN bun install
RUN cd packages/db && bunx prisma generate && cd ../..
RUN bun install

EXPOSE 8080

CMD ["bun", "run", "start:backend-ws"]




