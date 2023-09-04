FROM nginx:latest

COPY ./html /usr/share/nginx/html

COPY ./img /usr/share/nginx/html/img

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]