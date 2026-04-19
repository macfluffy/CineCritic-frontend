<p align="center">
  <img src="./src/assets/cine_critic_logo.png" alt="CineCritic Logo" width="444" />
</p>

# 🎬 CineCritic Frontend

Movie review and discovery platform built with React, backed by our
[CineCritic backend API](https://github.com/vetematts/CineCritic-backend.git).

## Contents

- [Repositories](#-repositories)
- [Deployed URLs](#-deployed-urls)
- [Prerequisites](#-prerequisites)
- [Hardware Requirements](#-hardware-requirements)
- [Frontend Install Instructions](#-frontend-install-instructions)
- [Environment Variables](#-environment-variables)
- [Setting up your own containerised server](#-setting-up-your-own-containerised-server)
- [Commands](#-commands)
- [Authentication](#-authentication)
- [Code Style Guide](#-code-style-guide)
- [Dependencies](#-dependencies)
- [Technology Choices and Alternatives](#-technology-choices-and-alternatives)
- [Licensing Notes](#-licensing-notes)
- [Data Source Attribution](#-data-source-attribution)
- [Key Endpoints Used](#-key-endpoints-used)

## 📂 Repositories

- Backend: https://github.com/vetematts/CineCritic-backend.git
- Frontend: https://github.com/vetematts/CineCritic-frontend.git

## 🚀 Deployed URLs

- Frontend App: https://cinecritic.app
- Fallback (Vercel): https://cinecritic-fawn.vercel.app
- Backend API: https://cinecritic.onrender.com

## ✅ Prerequisites

- Node.js 18+ and npm
- Git

## 💻 Hardware Requirements

- CPU: modern dual-core (or better) to run the dev server smoothly.
- RAM: 4 GB minimum (8 GB recommended) for build + test tooling.
- Disk: ~500 MB for `node_modules` + build output.
- Network: stable internet required (TMDB + backend API calls).
- OS: Windows 10+, macOS 12+, or a modern Linux distro.

## 🛠️ Frontend Install Instructions

1. **Clone the repo**
   ```bash
   git clone https://github.com/vetematts/CineCritic-frontend.git
   cd CineCritic-frontend
   ```
2. **Install dependencies**
   ```bash
   npm install
   ```
3. **Create `.env`**
   ```sh
   VITE_API_BASE_URL="http://localhost:4000"
   ```
4. **Start the app**
   ```bash
   npm run dev
   ```

## ⚙️ Environment Variables

Copy `.env.example` to `.env` and set your values:

- `VITE_API_BASE_URL` (required): backend API base URL

## Setting up your own containerised server
### Creating a Docker Container
Note: If you are running this on WSL (Ubuntu), you may need to open Docker Desktop first before executing the following commands.

1. Setup your ```.env``` file in the project root folder, following the ```.env.example``` template.

2. Create a clean install of the front end
```
docker compose down --remove-orphans 
docker compose build --no-cache
```

3. Run the image using the compose file. The container will have the name ```cinecritic-frontend-app```.
```
docker compose up -d
```

### Updating the Docker Container
1. Update the docker file
```
docker compose up --build
```

## 🧪 Commands

- `npm run dev` - start the dev server
- `npm run build` - build production bundle
- `npm run preview` - preview production build
- `npm run lint` - check style + code issues
- `npm run lint:fix` - auto-fix ESLint issues where possible
- `npm run format` - format with Prettier
- `npm run test` - run Vitest tests

## 🔐 Authentication

- Login via `POST /api/users/login` to receive a JWT (`token`).
- Store the token in `localStorage` and send it on protected routes as
  `Authorization: Bearer <token>`.
- Logout is stateless: `POST /api/users/logout` acknowledges the request; clients clear the token.

## 📏 Code Style Guide

This project follows the Google JavaScript Style Guide: https://google.github.io/styleguide/jsguide.html

Style is enforced with ESLint (eslint-config-google) and formatting is handled by Prettier.
ESLint is configured to defer formatting rules to Prettier to avoid conflicts.

## 📦 Dependencies

| Name                                                                                               | Description               |
| -------------------------------------------------------------------------------------------------- | ------------------------- |
| [react](https://www.npmjs.com/package/react)                                                       | UI library                |
| [react-router](https://www.npmjs.com/package/react-router)                                         | Client-side routing       |
| [styled-components](https://www.npmjs.com/package/styled-components)                               | Component-scoped styling  |
| [vite](https://www.npmjs.com/package/vite)                                                         | Build tool and dev server |
| [vitest](https://www.npmjs.com/package/vitest)                                                     | Unit testing              |
| [@testing-library/react](https://www.npmjs.com/package/@testing-library/react)                     | UI testing utilities      |
| [@testing-library/jest-dom](https://www.npmjs.com/package/@testing-library/jest-dom)               | DOM assertions            |
| [@testing-library/user-event](https://www.npmjs.com/package/@testing-library/user-event)           | User interaction testing  |
| [eslint](https://www.npmjs.com/package/eslint), [prettier](https://www.npmjs.com/package/prettier) | Linting and formatting    |

## 🧭 Technology Choices and Alternatives

### Core Framework & Tooling

**React + React Router**

- **Purpose:** Build the UI and handle client-side navigation.
- **Why Chosen:** Industry standard for SPAs; large ecosystem + strong community support.
- **Industry Relevance:** React and React Router are widely used in production SPAs.
- **Alternatives:** Next.js (SSR + routing), Vue (simpler template-driven approach).
- **Licensing:** MIT (see npm pages).

**Vite**

- **Purpose:** Fast dev server and production build pipeline.
- **Why Chosen:** Quick startup, fast HMR, and simple configuration.
- **Industry Relevance:** Modern standard build tool for React apps.
- **Alternatives:** Webpack, CRA.
- **Licensing:** MIT.

**Node.js + npm**

- **Purpose:** Runtime + package manager for tooling and builds.
- **Why Chosen:** Default ecosystem for modern JS tooling.
- **Industry Relevance:** Standard across frontend build pipelines.
- **Alternatives:** pnpm, yarn, bun.
- **Licensing:** Node.js (MIT), npm (Artistic-2.0).

### Styling & Testing

**styled-components**

- **Purpose:** Component-scoped styling with reusable patterns.
- **Why Chosen:** Keeps styles close to components and supports dynamic styling.
- **Industry Relevance:** Common in React projects for CSS-in-JS.
- **Alternatives:** CSS Modules, Tailwind.
- **Licensing:** MIT.

**Vitest + Testing Library**

- **Purpose:** Unit and interaction testing for React components.
- **Why Chosen:** Lightweight, Vite-native, and user-focused testing approach.
- **Industry Relevance:** Typical combo for modern React testing.
- **Alternatives:** Jest, Cypress (E2E).
- **Licensing:** MIT.

**ESLint + Prettier**

- **Purpose:** Enforce code style and formatting consistency.
- **Why Chosen:** Widely adopted tooling for JS projects.
- **Industry Relevance:** Standard in most professional codebases.
- **Alternatives:** Biome, StandardJS.
- **Licensing:** MIT.

## 📜 Licensing Notes

This project depends on open-source packages under permissive licenses (MIT/ISC/BSD-2/3).
See each dependency's npm page for details.

## 📌 Data Source Attribution

This product uses the TMDB API but is not endorsed or certified by TMDB.
See TMDB documentation: https://developer.themoviedb.org/docs

## 🧩 Key Endpoints Used

| Area        | Endpoints Used                                                                                                                |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Auth        | `POST /api/users/login`, `POST /api/users/signup`, `POST /api/users/logout`, `GET /api/users/me`                              |
| Users       | `GET /api/users/{id}`                                                                                                         |
| Public User | `GET /api/public/users/{id}/favourites`, `GET /api/public/users/{id}/watchlist`, `GET /api/public/users/{id}/reviews`         |
| Movies      | `GET /api/movies/trending`, `GET /api/movies/top-rated`, `GET /api/movies/search?q=`,                                         |
|             | `GET /api/movies/advanced?query=&year=&genres=&crew=&ratingMin=&ratingMax=`, `GET /api/movies/{id}`, `GET /api/movies/genres` |
| Reviews     | `GET /api/reviews/{tmdbId}`, `POST /api/reviews`, `PUT /api/reviews/{id}`, `DELETE /api/reviews/{id}`                         |
| Watchlist   | `GET /api/watchlist/{userId}`, `POST /api/watchlist`, `PUT /api/watchlist/{id}`, `DELETE /api/watchlist/{id}`                 |
| Favourites  | `GET /api/favourites/{userId}`, `POST /api/favourites`, `DELETE /api/favourites/{userId}/{tmdbId}`                            |

## CI/CD Pipeline
Need a SECRETS manager

On pull requests:
1. Merging code into the main branch

We only need to run an automation run on pull requests, whenever someone wants to merge their code into the main branch.

Whenever a user creates a pull request wanting to merge their feature on to the main branch, the Github Action workflow will:
   - Lint the code
   - then Test it
   - and create a test log

If successful, the user can have their code merged after a supervisor reviews it.

2. Containerising / Packing the application into a Docker Container

After the code has been approved for review, we containerise the application so that it can be hosted on cloud servers. 

Create a repository inside ECR. This is AWS's container repository, where you can store the container images of the front-end in aws.

Create a repository for the front-end container (as well as the back-end).

Create an admin user to be able to handle the ECR.
Needs the permissions: 
   AmazonEC2ContainerRegistryFullAccess
   AmazonECS_FullAccess
   AmazonECSTaskExecutionRolePolicy
   CloudWatchFullAccess
   SecretsManagerReadWrite

Next create the access keys for the admin user. We need this access key to be able to SSH / push the docker containers to ECR through the AWS CLI.

Download a copy and store your access keys somewhere safe. If you want to use them in your own repository, you can store them into your repository's secrets, and they can be accessed through github actions. Store them in the variables:
   AWS_ACCESS_KEY_ID
   AWS_SECRET_KEY

Configure your account:
```aws configure```

Enter your access key id, secret key, region, and file format (optional)
Connect to your IAM user to your docker (12 hour connection)
```aws ecr get-login-password --region <region> | docker login --username AWS --pasword-stdin <aws ecr repository uri without the "/reponame" at the end>```

Your console should output

```Login Succeeded```

Create the container.
   Give the container image the tag name that matches the ECR uri (include the /reponame at the end of the uri)

```docker tag cinecritic-frontend-app <aws ecr repository uri>```

Push the docker image by tag name. The tag name will match the aws ecr repo uri
```docker push <tag name>```

3. Setup the Task Definition. This is our instruction set to launch a container / group of containers
Goto ECS, create new Task Definition
Give the task definition family a name
Set to Amazon EC2 instances isntead of Fargate
Under Task Execution Role, select the drop down menu and select ```ecsTaskExecutionRole```
Add in the container definitions, Under Container - 1, give this container a name, then copy the ECR URI of the frontend docker image.
Set the container port to 5173, or whatever is matching then Click create at the bottom.

4. Deploy a grouping of EC2 instances to run our containers (aka Cluster)
Still in the ECS page click Clusters
Click Create Cluster
Give the Cluster a name, we will opt to use a single cluster to handle all the containers for frontend and backend.
Select Fargate then click Create Cluster.
Run the Task the cluster we'll be using

5. Attach the task to the cluster
Select your cluster
Click Tasks
Run new task
From the drop down select the task defined in #3.
Create.