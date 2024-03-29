# Strakker

> The best thing since sliced bread

## Contributing

```sh
$ git clone git@github.com:frederickfogerty/strakker.git
```

This clones the repository onto your computer. Make sure you have your ssh key registered to your GitHub account otherwise this will not work. (Pro-tip: use `ssh-keygen` in `~\.ssh` to generate a new one)

#### Installing Dependencies

Make sure you have [npm](https://www.npmjs.org/) and [bower](http://bower.io/) installed before running the following commands.

```sh
$ bower install 
$ npm install
```

These will download all the dependencies needed from the internet. If you have issues with this, run and hide, and call your local [sysadmin](mailto:frederickfogerty@gmail.com) for some help.

```sh
$ grunt
```

After your dependencies are installed, run this command, and it will compile the code (and watch for any changes) and copy it to `dev/`. Point your webserver to this address.

#### (A very small) Git Boot-camp

When developing in your own repository, periodically run `git pull` to see if there are any changes that someone else has created while you have been developing. This should run without a hitch, but if it doesn't- yep, you've got it- run and hide, and call your local [sysadmin](mailto:frederickfogerty@gmail.com) for some help.

After committing your changes, run `git push` to make sure everyone else can take advantage of your awesomeness. Please commit with useful descriptions, not just 'Improved [some component] code', and *please* use capitals.

Also, ***never*** force a push using any variant of `git push -f`, you're probably just doing it wrong. Your sysadmin will hunt you down and slaughter you, and then revert all your forced changes while laughing and watching Desperate Housewives.

We follow the [Git Flow](http://nvie.com/posts/a-successful-git-branching-model/) method for branching and version control, go read it.

**It's that simple!**
