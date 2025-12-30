# WordPress on Railway

Easily deploy [WordPress](https://wordpress.com/) on Railway with **seamless** support for **local development** out of the box.

This templates does not crash on deployment due to the [more than one MPM loaded](https://station.railway.com/questions/more-than-one-mpm-loaded-error-on-php-8-9c836859) error.

Focal point of this template compared to the others is the local development, so you can easily **create/manage** custom **WordPress plugins, themes and uploads** without relying on Railway's SSH to access the files.

The template is **flexible** and **extendable** so you can even use it in a **monorepo** or other project structures.

## Common Use Cases

- You prefer **self-hosting** WordPress.
- You want to **develop** WordPress **plugins and themes**.
- You want to use WordPress as a **headless CMS** (API) for your frontend application.
- You have an **existing WordPress** installation and want to migrate/use it on Railway.
- You **can't deploy** the **other** WordPress **templates** due to crashes from the [more than one MPM loaded](https://station.railway.com/questions/more-than-one-mpm-loaded-error-on-php-8-9c836859) error.

## Deployment

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/wordpress-nodejsdocker?referralCode=5W_-3P)

1. Click the "Deploy on Railway" button above.
2. Follow the instructions to deploy the template at Railway.
3. Open the URL assigned by Railway in your browser (eg. https://your-app-name.up.railway.app).
4. Enjoy!

## Local Development

In case you want to develop WordPress locally.

- Manage plugins, themes and uploads locally in these directories:
  - `./data/plugins`
  - `./data/themes`
  - `./data/uploads`
- Will automatically sync local changes to WordPress.
- Add an existing WordPress installation in `./data/migrate` to use it as the base installation.
- Only `plugins`, `themes` and `uploads` are synced, the rest are ignored by default to avoid messing up the core files of WordPress.
  - Feel free to add more directories if you need them.

### Prerequisites

Prerequisites for local development.

- [Docker](https://www.docker.com/)
- [Node.js & npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) (optional)
  - Only required for running `yarn dev` which is easier to remember, but you can run `docker compose -f compose.yaml up` instead.

### Setup

Assuming you have already deployed the template on Railway:

1. Clone this repository or create a new one using this as a template.
2. Publish the repository to GitHub.
3. At Railway change the `Source Repo` to your cloned repository to automatically redeploy the service from your own GitHub commits (optional).
4. Either run:
   - `yarn install` and then `yarn dev` to start the server.
   - or `docker compose -f compose.yaml up`.
5. Open http://localhost:8080 in your browser to access WordPress.

### Troubleshooting

Report any issues or suggestions on [GitHub](https://github.com/deltabox-studio/wordpress-railway/issues) or [Railway](https://station.railway.com/templates/word-press-node-js-docker-d054a70f).

#### Missing Directories

If you accidentally delete the directories `data/plugins`, `data/themes`, `data/uploads` or `data/migrate` you can run `yarn dirs` to recreate them.

#### "dependency failed to start: container wordpress-railway-wordpress-db-1 is unhealthy"

If you get this error upon container startup in your local environment, you should try one or more of the following:
- Stop the container with `yarn stop` or `docker compose -f compose.yaml down` and restart it with `yarn dev` or `docker compose -f compose.yaml up`.
- If the issue persists, you can try to delete the container including it's image and volumes by running `yarn clean` or `docker compose -f compose.yaml down --volumes --rmi all` and then recreate it with `yarn dev` or `docker compose -f compose.yaml up` (**IMPORTANT:** This will delete all data in the volumes, so make sure you have a backup of your data before running this command).

# License

- **WordPress:** [GPL-2.0 (GNU General Public License v2.0)](https://wordpress.org/about/license/).
- **MySQL:** [GPL-2.0 (GNU General Public License v2.0)](https://www.mysql.com/about/legal/licensing/oem/).
