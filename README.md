# WordPress on Railway

This template allows you to easily deploy WordPress to Railway with support for local development out of the box.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/templates)

## Local Development

- Manage plugins, themes and uploads locally in these linked directories:
  - `./data/plugins`
  - `./data/themes`
  - `./data/uploads`
- Will automatically sync local changes to the WordPress installation.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Node.js & npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) (optional)
  - Only required for running `yarn dev` which is easier to remember, but you can run `docker compose -f compose.yaml up` instead.

### Setup

Assuming you have already deployed the template in Railway:

1. Clone this repository.
2. Publish the repository to GitHub.
3. At Railway change the `Source Repo` to your cloned repository instead to automatically redeploy the service on new GitHub commits.
4. Either run:
   - `yarn install` and then `yarn dev` to start the server.
   - or `docker compose -f compose.yaml up`.
5. Open http://localhost:8080 in your browser to access WordPress.

## Deployment

1. Click the "Deploy on Railway" button above.
2. Follow the instructions to deploy the template at Railway.
3. Open the URL assigned by Railway in your browser (eg. https://your-app-name.up.railway.app).
4. Enjoy!
