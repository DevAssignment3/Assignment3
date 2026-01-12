
FROM node:alpine AS build-stage


WORKDIR /app


COPY package*.json ./

RUN npm install


COPY . .


RUN npx parcel build "./src/index.html" "./src/notices.html" "./src/exams.html" "./src/admissions.html" "./src/contact.html" --dist-dir "./dist" --public-url "./" --no-cache


FROM nginx:alpine


COPY --from=build-stage /app/dist /usr/share/nginx/html


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]