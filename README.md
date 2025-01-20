
# Inception Project - 42 Network

## Introduction

The **Inception** project is a foundational project in the 42 Network, designed to help you understand and configure various systems, tools, and processes commonly used in a Unix environment. It is an essential part of the 42 curriculum, introducing students to containerization, system administration, networking, and automated deployment. Through this project, students will gain hands-on experience in configuring and managing various systems while learning to automate tasks using scripts.

## Objective

The objective of this project is to deploy a simple, self-contained server architecture, including essential services such as:

- **Web server** (Nginx)
- **Database** (MariaDB or PostgreSQL)
- **PHP** (FPM for dynamic content handling)
- **Firewall** configuration
- **Monitoring tools**

The entire project should be containerized using **Docker** and managed through **Docker Compose**. Students are expected to configure the services to communicate with each other and apply best practices for security and system management.

## Learning Goals

- Understand Docker and containerization
- Set up Nginx to serve static and dynamic content
- Configure a database server (MariaDB or PostgreSQL)
- Understand and implement basic network security (firewall configuration)
- Learn basic monitoring and system health checks
- Practice automation and scripting for configuration

## Setup

Follow these steps to set up and run the project locally:

### Prerequisites

- Docker
- Docker Compose
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<username>/inception.git
   cd inception
   ```

2. Build the Docker containers:
   ```bash
   docker-compose build
   ```

3. Start the services:
   ```bash
   docker-compose up -d
   ```

4. Once the containers are running, you can access your web application through `http://localhost`.

### Services and Configuration

- **Nginx**: Set up to serve static content and handle PHP files via PHP-FPM.
- **MariaDB**: A database server to store data.
- **PHP-FPM**: Handles dynamic content and integrates with Nginx for PHP support.
- **Firewall**: A basic firewall configuration to secure the containers.
- **Docker Compose**: Used to define and run multi-container Docker applications.

## Project Structure

- **Dockerfile**: The configuration for building the containerized web server and database.
- **docker-compose.yml**: Defines the Docker services (web, database, etc.) and their configuration.
- **nginx.conf**: Configuration file for Nginx, setting up reverse proxy, file paths, etc.
- **php.ini**: PHP configuration file, tuned for this project’s needs.
- **firewall.sh**: Script for setting up basic firewall rules.
- **README.md**: This file.

## Requirements

- Docker and Docker Compose must be installed.
- A running instance of the system using Docker.
- Your project should run in a development container with multiple services (Nginx, database, PHP, etc.).


## Conclusion

The **Inception** project is a critical step in mastering system administration, networking, and containerization technologies. Successful completion of this project will lay a strong foundation for further advanced projects in the 42 Network curriculum.
