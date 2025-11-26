% git-feature-merge(1) Version ${VERSION} | git-feature-merge

# NAME

Merge squash all commits of the current branch into the default branch

## HOW IT WORKS

This command will merge all commits of the current branch into one commit on the default branch
(ie `main`)

You can see all commit with the [git-feature-log command](git-feature-log.md).

## COMMIT MESSAGE HANDLING

You can give the subject as parameter.

The body of the commit message is created automatically.
It's created via concatenation if all subjects and body of commits message
of the working branch.

At the end, the editor is open to give you the possibility to change it.
(tip: `ZZ` to save and close VIM)

## SYNOPSIS

${SYNOPSIS}
