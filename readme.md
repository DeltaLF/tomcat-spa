# Tomcat SPA with Rewrite Rules

This repository demonstrates how to configure Tomcat to serve a Single Page Application (SPA) with client-side routing, while also supporting backend API endpoints.

## Overview

The setup uses Tomcat's `RewriteValve` to redirect all requests to the SPA's `index.html`, except for those starting with `/api/`, which are intended for backend API calls.

## Prerequisites

- Docker and Docker Compose installed.

## Setup

1.  **Clone the Repository:**

    ```bash
    git clone <your-repository-url>
    cd <your-repository-directory>
    ```

2.  **Verify File Structure:**

    Ensure your project has the following structure:

    ```
    <your-repository-directory>/
    ├── docker-compose.yml
    ├── tomcat/
    │   ├── Dockerfile
    │   └── webapp/
    │       ├── index.html
    │       └── META-INF/
    │           └── context.xml
    │       └── WEB-INF/
    │           └── rewrite.config
    ```

3.  **rewrite.config (tomcat/webapp/WEB-INF/rewrite.config):**

    ```
    RewriteCond %{REQUEST_URI} !^/api/.*$
    RewriteRule ^/(.*)$ /index.html [L]
    ```

4.  **Build and Run:**

    ```bash
    docker-compose build
    docker-compose up
    ```

5.  **Access the Application:**

    - Open your web browser and navigate to `http://localhost:8080/`. This should display your SPA's `index.html`.
    - Any route except those starting with `/api/` will serve the index.html file. For example `http://localhost:8080/test` will serve the index.html file.
    - Requests to `http://localhost:8080/api/<your-api-endpoint>` will not be rewritten, allowing your backend API to handle them.

## Explanation

- **Dockerfile:** Creates a Tomcat container and copies your application files.
- **context.xml:** Configures the `RewriteValve`.
- **rewrite.config:** Defines the rewrite rules. The `RewriteCond` ensures that only requests not starting with `/api/` are rewritten to `index.html`.

## Notes

- Ensure that your `index.html` file is in the `webapp` directory.
- Place your backend API code to handle requests starting with `/api/`.
