FROM public.ecr.aws/lambda/nodejs:latest

COPY app.ts package.json package-lock.json tsconfig.json ./

RUN npm ci &&\
    npm run build

COPY app.js ${LAMBDA_TASK_ROOT}

CMD ["app.handler"]
