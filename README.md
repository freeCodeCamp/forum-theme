# discourse-theme

> Themes that we use on our forums: https://forum.freecodecamp.org

## Contributing

### Themes

This repository contains one Discourse theme with four palettes defined in
`about.json`: light, dark, dark-low-contrast, and dark-very-low-contrast.

Discourse loads `common/common.scss`, which imports the base, header, and footer
styles from `stylesheets/`. Palette-dependent styles are in
`common/color_definitions.scss`. The initializer in
`javascripts/discourse/api-initializers/` registers the header and footer
components with Discourse’s plugin outlets.

You can learn more about themes in [this comprehensive article](https://meta.discourse.org/t/developer-s-guide-to-discourse-themes/93648) and learn how to test your changes with theme creator using [this article](https://meta.discourse.org/t/beginners-guide-to-using-theme-creator-and-theme-cli-to-start-building-a-discourse-theme/108444).

### Plugins

> Note: The theme plugins (our own and third party) have their own repositories.

Some of the theme plugins we are using as of now are:

- [Hamburger Theme Selector](https://github.com/discourse/discourse-hamburger-theme-selector)
- ~~[Users Top Nav](https://github.com/freeCodeCamp/discourse-users-nav) - _forked
  from discourse_~~ [User Top Nav](https://github.com/discourse/discourse-users-nav) Using the official plugin. 
- [Trust Level Avatar Flair](https://github.com/tshenry/discourse-trust-level-avatar-flair)

## Releases

This repo uses [release-please](https://github.com/googleapis/release-please). Commits landing on `main` must use conventional-commit subjects (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`) - the subject determines the version bump and the changelog entry.

release-please keeps an open `chore(main): release x.y.z` PR holding the `CHANGELOG.md` and `about.json` `theme_version` updates. Merging that PR tags the release and publishes a GitHub Release.

## Support:

You can report any support issues, bugs in our
[Contributors Chat room](https://discord.gg/PRyKn3Vbay) or on the
[main repository's issue tracker](https://github.com/freeCodeCamp/freeCodeCamp/issues).
