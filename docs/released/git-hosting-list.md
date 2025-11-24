% git-hosting-list(1) Version Latest | List hosted git repositories
## DESCRIPTION

List hosted git repositories

## SYNOPSIS

List hosted repositories
```bash
git-hosting-list git_hosting_service [xxx]
```

where:

* git_hosting_service         - the git hosting name to read from (github, gogs, ...)
* --silent                    - a boolean option that will output only the API_REPOS
* --jq-raw-output             - a boolean option that will not output the output as json
* --jq-expression='xxxx'      - the jq expression to parse the JSON API response
* --report=value              - the name of a preconfigured report where the value may be:
                                 * ls       - the repo fullname separated by the IFS character
                                 * asis     - the full json
                                 * csv      - a csv
* --filter-max-repo-count='x' - the maximum number of repositories to retrieve
* --help                      - this help
