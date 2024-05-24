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
            alt={{settings.title}}
          />
        </a>
      </div>
    </nav>
  </template>);

  let curriculum_nav = '';
  const curriculum_slugs = settings.curriculum_slug.split('|');
  const languages = settings.languages.split('|');

  window.addEventListener("DOMContentLoaded", (event) => {
    curriculum_nav = document.querySelector('.curriculum-nav');
  });

  api.onPageChange((_url, _title) => {
    const controller = api.container.lookup('controller:navigation/category');
    const category = controller.get("category");

    languages.forEach((lang, i) => {
      if (lang.toLowerCase() === category?.slug?.toLowerCase()) {
        if (curriculum_nav.href !== settings.curriculum_src + curriculum_nav.href.split('/')[3]) {
          curriculum_nav.href = settings.curriculum_src + curriculum_slugs[i];
        }
      } else {
        if (curriculum_nav.href !== settings.curriculum_src) {
          curriculum_nav.href = settings.curriculum_src;
        }
      }
    });
  })
});
