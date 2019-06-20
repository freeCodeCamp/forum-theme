# discourse-theme

> Themes that we use on our forums: https://www.freecodecamp.org/forum

## Contributing

### Themes

We have [separate branches](https://github.com/freeCodeCamp/discourse-theme/branches) for dark and light color schemes. 

You should make fixes and make pull requests against these indiviually for them to work on the variants. These branches are intentionally orphaned to prevent any conflicts. You should make changes on each branch that you want to fix separately, by starting off from them as base branches, like so:

```sh
git checkout production-light-theme
git checkout -b fix/update-common-styles-light
```

```sh
git checkout production-dark-theme
git checkout -b fix/update-common-styles-dark
```

> Note: All pull requests against the master branch will be closed, its a document only branch.

You can learn more about themes in this comprehensive article: https://meta.discourse.org/t/developer-s-guide-to-discourse-themes/93648


### Plugins

> Note: The theme plugins (our own and third party) have their own repositories.

Some of the theme plugins we are using as of now are:

- [Unformatted Code Detector](https://github.com/lionel-rowe/unformatted_code_detector)
- [Hamburger Theme Selector](https://github.com/discourse/discourse-hamburger-theme-selector)
- [Users Top Nav](https://github.com/freeCodeCamp/discourse-users-nav) - *forked from discourse*
- [Trust Level Avatar Flair](https://github.com/tshenry/discourse-trust-level-avatar-flair)

## Support:

You can report any support issues, bugs in our [Contributors Chat room](https://gitter.im/FreeCodeCamp/Contributors).
