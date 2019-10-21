FROM node:10 as react-app
# Create app directory
WORKDIR /usr/src/app
# Set a temporary variable
ENV test="Hello Docker"
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.12-alpine
COPY --from=react-app /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]  