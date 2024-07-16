import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.8", (api) => {
  const siteSettings = api.container.lookup("service:site-settings");
  const rawLabel = api.container.lookup("service:site").mobileView
    ? settings.curriculum_title_short
    : settings.curriculum_title;

  api.renderInOutlet("before-header-panel", <template>
    <a class="curriculum-nav" href={{settings.curriculum_src}}>{{rawLabel}}</a>
  </template>);

  api.renderInOutlet("above-site-header", <template>
    <nav class="site-nav nav-padding">
      <div class="site-nav-logo">
        <a href="/">
          <img
            id="site-logo"
            class="logo-big"
            src={{siteSettings.site_logo_url}}
            alt={{siteSettings.title}}
          />
        </a>
      </div>
    </nav>
  </template>);

  const curriculum_slugs = settings.curriculum_slug.split('|');
  const languages = settings.languages.split('|');

  api.onPageChange((_url, _title) => {
    const curriculum_nav = document.querySelector('.curriculum-nav');
    const category = api.container.lookup("service:discovery").category;

    if (!curriculum_nav) {
      return;
    }
    // Reset to default href;
    curriculum_nav.href = settings.curriculum_src;

    languages.forEach((lang, i) => {
      if (lang.toLowerCase() === category?.slug?.toLowerCase()) {
        const url_path = new URL(curriculum_slugs[i], settings.curriculum_src);
        curriculum_nav.href = url_path.href;
      }
    });
  })
});
