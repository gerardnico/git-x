# Contrib

We follow the [GitHub contributing guideline](https://docs.github.com/en/contributing)

## List

All contrib/devops artifacts are in the [contrib directory](contrib)

### Calling the next version from another directory

The scripts are installed via brew and are used in our day-to-day work.
If you want to call the last version that you develop locally, you need to:

* set the `BASHLIB_PATH` in your bashrc
* and to call the script directly.

If you are not on the project directory, they are not available in the `PATH`, the brew scripts are

You can create alias in your `.bashrc`. For instance
```bash
# Next version
GITURE_BIN_PATH="$HOME/code/giture/bin"
alias nga="$GITURE_BIN_PATH/git-amend"
```

### Hosting Backup Dev Note

The `devnotes` of the [git-hosting-backup command](docs/commands/git-hosting-backup.md) are written in
the  [git-hosting-backup-dev file](contrib/git-hosting-backup-dev.md)

### IDE settings

You should exclude the [docs website directory ](website/docs)
as it's generated from the [docs](docs) directory.

### Release

Release is performed with the [release](contrib/release/release) script.

### WebSite and Documentation

You can start the whole processing with in the [website directory](website):

```bash
task start
```

It will:

* watch the [docs directory](docs)
* and sync it to the [docusaurus docs](website/docs) directory

Note: Putting the sync command in the npm script `start` property of [package](website/package.json) does not work
