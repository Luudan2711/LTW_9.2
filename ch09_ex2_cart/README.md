# JSP Cart Application

A simple JSP/Servlet shopping cart application demonstrating JSTL usage.

## Features

- Product listing with JSTL forEach loops
- Shopping cart with session storage
- Add/Remove/Update cart items
- XSS protection with c:out tags

## Technology Stack

- Java JSP/Servlet
- Tomcat 10
- JSTL (JavaServer Pages Standard Tag Library)
- HTML/CSS

## Local Development

1. Deploy to Tomcat webapps directory
2. Access: http://localhost:8080/ch09_ex2_cart/

## Docker Deployment

```bash
# Build Docker image
docker build -t jsp-cart-app .

# Run locally
docker run -p 8080:8080 jsp-cart-app
```

## OnRender Deployment

1. Connect your GitHub repository to OnRender
2. Choose "Web Service" 
3. Use Docker environment
4. OnRender will automatically build and deploy using the Dockerfile

The application will be available at:
- Main URL: `https://your-app-name.onrender.com/`
- Direct JSP: `https://your-app-name.onrender.com/index.jsp`

## Accessing the Application

After deployment, try these URLs:
1. `https://ltw-9-2.onrender.com/` (auto-redirects to index.jsp)
2. `https://ltw-9-2.onrender.com/index.jsp` (direct access to CD list)