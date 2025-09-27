import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.8", (api) => {
  const siteSettings = api.container.lookup("service:site-settings");

  // Determine label based on mobile/desktop view
  const getCurriculumLabel = () => {
    return api.container.lookup("service:site").mobileView
      ? settings.curriculum_title_short
      : settings.curriculum_title;
  };

  // Render curriculum link in universal navigation
  api.renderInOutlet("before-header-panel", <template>
    <a class="curriculum-nav" href={{settings.curriculum_src}}>{{getCurriculumLabel()}}</a>
  </template>);

  // Render site logo in navigation
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

  // Update curriculum link dynamically on page change
  api.onPageChange(() => {
    const curriculumNav = document.querySelector('.curriculum-nav');
    const category = api.container.lookup("service:discovery").category;

    if (!curriculumNav) return;

    // Reset to default link
    curriculumNav.href = settings.curriculum_src;

    // Update link if current category matches a language
    languages.forEach((lang, i) => {
      if (lang.toLowerCase() === category?.slug?.toLowerCase()) {
        const urlPath = new URL(curriculumSlugs[i], settings.curriculum_src);
        curriculumNav.href = urlPath.href;
      }
    });

    // Update label on mobile/desktop switch
    curriculumNav.textContent = getCurriculumLabel();
  });
});
