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

  // let curriculum_nav = '';
  const curriculum_slugs = settings.curriculum_slug.split('|');
  const languages = settings.languages.split('|');

  // window.addEventListener("DOMContentLoaded", (event) => {
  //   const curriculum_nav = document.querySelector('.curriculum-nav');
  // });

  api.onPageChange((_url, _title) => {
    const curriculum_nav = document.querySelector('.curriculum-nav');
    const category = api.container.lookup("service:discovery").category;
    console.log(api.container.lookup("service:discovery"));

    console.log(category);
    console.log(settings.curriculum_src);
    console.log(curriculum_nav);
    languages.forEach((lang, i) => {
      if (!curriculum_nav) {
        return;
      }
      console.log(curriculum_slugs, i);
      if (lang.toLowerCase() === category?.slug?.toLowerCase()) {
        curriculum_nav.href = settings.curriculum_src + curriculum_slugs[i];
      } else {
        curriculum_nav.href = settings.curriculum_src;
      }
    });
    console.log(settings.curriculum_src);
    console.log(curriculum_nav);
  })
});
