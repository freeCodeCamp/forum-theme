// javascripts/api-initializers/freecodecamp.js

import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.8", (api) => {
  const siteSettings = api.container.lookup("service:site-settings");

  const getCurriculumLabel = () => {
    return api.container.lookup("service:site").mobileView
      ? settings.curriculum_title_short
      : settings.curriculum_title;
  };

  api.renderInOutlet("before-header-panel", <template>
    <a class="curriculum-nav" href={{settings.curriculum_src}}>{{getCurriculumLabel()}}</a>
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

  const curriculumSlugs = settings.curriculum_slug.split('|');
  const languages = settings.languages.split('|');

  api.onPageChange(() => {
    const curriculumNav = document.querySelector('.curriculum-nav');
    const category = api.container.lookup("service:discovery").category;

    if (!curriculumNav) return;

    curriculumNav.href = settings.curriculum_src;

    languages.forEach((lang, i) => {
      if (lang.toLowerCase() === category?.slug?.toLowerCase()) {
        const urlPath = new URL(curriculumSlugs[i], settings.curriculum_src);
        curriculumNav.href = urlPath.href;
      }
    });

    curriculumNav.textContent = getCurriculumLabel();
  });
});
