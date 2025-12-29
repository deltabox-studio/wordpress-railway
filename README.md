# WordPress on Railway

Easily deploy WordPress to Railway with **seamless** support for **local development** out of the box.

Focus is on the local development, so you can easily **create/manage custom plugins, themes or uploads** without relying on Railway's SSH.

The template is easily **flexible** so you can use it in a **monorepo** or **extend it as you'd like**.

## Deployment

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/NrThZN?referralCode=5W_-3P)

1. Click the "Deploy on Railway" button above.
2. Follow the instructions to deploy the template at Railway.
3. Open the URL assigned by Railway in your browser (eg. https://your-app-name.up.railway.app).
4. Enjoy!

## Local Development

- Manage plugins, themes and uploads locally in these directories:
  - `./data/plugins`
  - `./data/themes`
  - `./data/uploads`
- Will automatically sync local changes to WordPress.
- Add an existing WordPress installation in `./data/migrate` to use it as the base installation.
- Only `plugins`, `themes` and `uploads` are synced, the rest are ignored by default to avoid messing up the core files of WordPress.
  - Feel free to add more directories if you need them.

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

### Troubleshooting

Report any issues or suggestions [here](https://github.com/deltabox-studio/wordpress-railway/issues).

- If you accidentally delete the directories `data/plugins`, `data/themes`, `data/uploads` or `data/migrate` you can run `yarn dirs` to recreate them.
