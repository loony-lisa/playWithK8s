server {
    listen 8080;
    server_name localhost;

    root /var/www/html/;
    index index.html;

    location / {
        try_files $uri $uri/ ./index.html;
    }

    location /api/drink {
        proxy_pass http://my-server-service:3000/api/drink;
    }
}
