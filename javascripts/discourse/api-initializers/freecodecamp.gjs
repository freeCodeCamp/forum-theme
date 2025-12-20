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

  api.renderInOutlet("below-footer", <template>
    {{! inject footer }}
    <footer class="site-footer">
      <div class="footer-container">
        <div class="footer-top">
          <div class="footer-desc-col">
            <p>{{settings.footer_paragraph_1}}</p>
            <p>{{settings.footer_paragraph_2}}</p>
            <p>{{settings.footer_paragraph_3}}</p>
            <p class="footer-donation">
              <a
                href="https://freecodecamp.org/donate"
                class="inline"
                rel="noopener noreferrer"
                target="_blank"
              >{{settings.footer_donation_cta}}</a>
            </p>
          </div>
          
          <div class="trending-guides">
            <h2 id="trending-guides" class="col-header">{{settings.footer_columns_header}}</h2>              
            <ul aria-labelledby="trending-guides" class="trending-guides-articles">
              <li>
                <a href={{settings.article0link}} target="_blank">
                  {{settings.article0title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article1link}} target="_blank">
                  {{settings.article1title}}
                </a>
              </li>
              <li>
                <a href={{settings.article2link}} target="_blank">
                  {{settings.article2title}}
                </a>
              </li>  
              <li>
                <a href={{settings.article3link}} target="_blank">
                  {{settings.article3title}}
                </a>
              </li>
              <li>
                <a href={{settings.article4link}} target="_blank">
                  {{settings.article4title}}
                </a>
              </li>
              <li>
                <a href={{settings.article5link}} target="_blank">
                  {{settings.article5title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article6link}} target="_blank">
                  {{settings.article6title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article7link}} target="_blank">
                  {{settings.article7title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article8link}} target="_blank">
                  {{settings.article8title}}
                </a>
              </li>
              <li>
                <a href={{settings.article9link}} target="_blank">
                  {{settings.article9title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article10link}} target="_blank">
                  {{settings.article10title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article11link}} target="_blank">
                  {{settings.article11title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article12link}} target="_blank">
                  {{settings.article12title}}
                </a>
              </li>
              <li>
                <a href={{settings.article13link}} target="_blank">
                  {{settings.article13title}}
                </a>
              </li>
              <li>
                <a href={{settings.article14link}} target="_blank">
                  {{settings.article14title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article15link}} target="_blank">
                  {{settings.article15title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article16link}} target="_blank">
                  {{settings.article16title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article17link}} target="_blank">
                  {{settings.article17title}}
                </a>
              </li>
              <li>
                <a href={{settings.article18link}} target="_blank">
                  {{settings.article18title}}
                </a>
              </li>  
              <li>
                <a href={{settings.article19link}} target="_blank">
                  {{settings.article19title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article20link}} target="_blank">
                  {{settings.article20title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article21link}} target="_blank">
                  {{settings.article21title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article22link}} target="_blank">
                  {{settings.article22title}}
                </a>
              </li>
              <li>
                <a href={{settings.article23link}} target="_blank">
                  {{settings.article23title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article24link}} target="_blank">
                  {{settings.article24title}}
                </a>
              </li>
              <li>
                <a href={{settings.article25link}} target="_blank">
                  {{settings.article25title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article26link}} target="_blank">
                  {{settings.article26title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article27link}} target="_blank">
                  {{settings.article27title}}
                </a>
              </li>
              <li>  
                <a href={{settings.article28link}} target="_blank">
                  {{settings.article28title}}
                </a>
              </li>  
              <li>
                <a href={{settings.article29link}} target="_blank">
                  {{settings.article29title}}
                </a>
              </li>  
            </ul>
          </div>
        </div>
        <div class="footer-bottom">
          <div class="col-header">Our Nonprofit</div>
          <div class="footer-divider"></div>
          <div class="our-nonprofit">
            <a href={{settings.footer_about_link}}>{{settings.footer_about_text}}</a>
            <a
              href={{settings.footer_Alumni_Network_link}}
              rel="noopener noreferrer"
              target="_blank"
            >{{settings.footer_Alumni_Network_text}}</a>
            <a href={{settings.footer_Open_Source_link}}>{{settings.footer_Open_Source_text}}</a>
            <a
              href={{settings.footer_Shop_link}}
              rel="noopener noreferrer"
              target="_blank"
            >{{settings.footer_Shop_text}}</a>
            <a href={{settings.footer_Support_link}}>{{settings.footer_Support_text}}</a>
            <a href={{settings.footer_Sponsors_link}}>{{settings.footer_Sponsors_text}}</a>
            <a href={{settings.footer_Academic_Honesty_link}}
            >{{settings.footer_Academic_Honesty_text}}</a>
            <a href={{settings.footer_Code_of_Conduct_link}}
            >{{settings.footer_Code_of_Conduct_text}}</a>
            <a href={{settings.footer_Privacy_Policy_link}}
            >{{settings.footer_Privacy_Policy_text}}</a>
            <a href={{settings.footer_Terms_of_Service_link}}
            >{{settings.footer_Terms_of_Service_text}}</a>
            <a href={{settings.footer_Copyright_Policy_link}}
            >{{settings.footer_Copyright_Policy_text}}</a>
          </div>
        </div>
      </div>
    </footer>
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
