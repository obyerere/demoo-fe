FROM node:12.2.0 as build
# set working directory
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9
RUN npm i rxjs@6 --save
# add app
COPY . /app
# generate build
RUN ng build --output-path=/app/dist/AngularJwtAuth
############
### prod ###
############
# base image
FROM nginx:1.16.0-alpine
# copy artifact build from the 'build environment'
COPY --from=build /app/dist/AngularJwtAuth /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# expose port 80
EXPOSE 80
# run nginx
CMD ["nginx", "-g", "daemon off;"]
