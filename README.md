# Kometen Backup-db

## How do I install these formulae?

`brew install kometen/backup-db/<formula>`

Or `brew tap kometen/backup-db` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "kometen/backup-db"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).


Create new tap-package and a default installer-script with Rust:

```
brew tap-new kometen/backup-db
brew create --tap kometen/backup-db --rust https://github.com/kometen/backup-db/archive/refs/tags/v0.1.1.tar.gz
```

This will install two default-yaml-files in the folder `.github/workflows`.

Create a branch in the repo, ie. `v0.1.1`, push this new branch to Github, create a PR and tests are run. When tests are completed without
errors add the label `pr-pull` and files for installing the `brew tap` package are created. The branch is deleted after finishing this step.
Switch back to branch `main` on your local repo and pull changes from remote.


Update a tap to a newer version, use a different name for the script, ie. v0.1.1 when asked for a script-name:

```
brew create --tap kometen/backup-db --rust https://github.com/kometen/backup-db/archive/refs/tags/v0.1.1.tar.gz
```

Copy the updated URL and hash from the new file `Formula/v0.1.1.rb` to the existing script. Create a branch and push as described above.
