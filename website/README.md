# giture Website

This website is built using [Docusaurus](https://docusaurus.io/)


## Local Development

```bash
npx docusaurus start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.
https://localhost:3000/giture

## Build

```bash
yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

## Deployment

Using SSH:

```bash
USE_SSH=true yarn deploy
```

Not using SSH:

```bash
GIT_USER=<Your GitHub username> yarn deploy
```

If you are using GitHub pages for hosting, this command is a convenient way to build the website and push to the `gh-pages` branch.

Clean the `gh-pages` history
```bash
# Creates a new branch with no parent commits
# Essentially a branch with a completely clean slate.
git checkout --orphan gh-pages-new
git commit -m "Fresh start"
git branch -D gh-pages
git branch -m gh-pages
git push -f origin gh-pages
```
