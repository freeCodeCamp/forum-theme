import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.8", (api) => {
  const siteSettings = api.container.lookup("service:site-settings");
  const rawLabel = api.container.lookup("service:site").mobileView
    ? settings.curriculum_title_short
    : settings.curriculum_title;

  api.headerButtons.add("curriculum-nav", <template>
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
});
