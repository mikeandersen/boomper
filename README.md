<h1 align="center">
  <img src="design/logo.svg" alt="Bumper Logo" width="350" />
</h1>

<p align="center">Update version numbers in files whenever new releases are published to GitHub. Built with <a href="https://github.com/probot/probot">Probot</a>.</p>

---

<p align="center"><a href="https://github.com/apps/bumper"><img src="design/install-button.svg" alt="Install the GitHub App" /></a></p>

---

## Usage

Firstly, you’ll need to install the [Bumper GitHub App](https://github.com/apps/bumper). This listens out for any releases, or any changes to the configuration.

Then, add a `.github/bumper.yml` configuration file to the GitHub repository where you publish new releases to.

For example, given the following `.github/bumper.yml` file:

```yml
updates:
- path: README.md
  pattern: 'https://someurl.com/(v.*)/download.zip'
```

And given the following `README.md` file:

```markdown
Install with `curl https://someurl.com/v1.0.0/download.zip`
```

Then when a new release is published (e.g. `v2.0.0`), Bumper will update the `README.md` to:

```markdown
Install with `curl https://someurl.com/v2.0.0/download.zip`
```

## Configuration options

You can configure Bumper using the following key in your `.github/bumper.yml` file:

|Key|Required|Description|
|-|-|-|
|`updates`|Required|A list of paths and patterns to update when a new release is published.|
|`updates.[].path`|Required|The path to the file to update.|
|`updates.[].pattern`|Required|The regular expression containing a single group, which will be used to match and update the version number in the file.|
|`updates.[].branch`|Optional|The branch to update. Default is `master`.|
|`branches`|Optional|The branches to listen for configuration updates to `.github/bumper.yml`. Useful if you want to test the app on a pull request branch. Default is `"master"`.|

Bumper also supports [Probot Config](https://github.com/probot/probot-config), if you want to store your configuration files in a central repository.

## Developing

If you have Node v10+ installed locally, you can run the tests, and a local app, using the following commands:

```sh
# Install dependencies
yarn

# Run the tests
npm test

# Run the app locally
npm start
```

If you don't have Node installed, you can use [Docker Compose](https://docs.docker.com/compose/):

```sh
# Run the tests
docker-compose run --rm app npm test
```

## Contributing

Third-pary contributions are welcome! 🙏🏼 See [CONTRIBUTING.md](CONTRIBUTING.md) for step-by-step instructions.

If you need help or have a question, let me know via a GitHub issue.

## Deployment

If you want to deploy your own copy of Bumper, follow the [Probot Deployment Guide](https://probot.github.io/docs/deployment/).
