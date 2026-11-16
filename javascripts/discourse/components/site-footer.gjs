import Component from "@glimmer/component";

// The setting names retain their original casing for existing installations.
const nonprofitLinkNames = [
  "about",
  "Alumni_Network",
  "Open_Source",
  "Shop",
  "Support",
  "Sponsors",
  "Academic_Honesty",
  "Code_of_Conduct",
  "Privacy_Policy",
  "Terms_of_Service",
  "Copyright_Policy",
];

export default class SiteFooter extends Component {
  get guides() {
    return Array.from({ length: 30 }, (_, index) => ({
      href: settings[`article${index}link`],
      title: settings[`article${index}title`],
    }));
  }

  get nonprofitLinks() {
    return nonprofitLinkNames.map((name) => ({
      href: settings[`footer_${name}_link`],
      title: settings[`footer_${name}_text`],
      newTab: name === "Alumni_Network" || name === "Shop",
    }));
  }

  <template>
    <footer class="site-footer">
      <div class="footer-container">
        <div class="footer-top">
          <div class="footer-desc-col">
            <p>{{settings.footer_paragraph_1}}</p>
            <p>{{settings.footer_paragraph_2}}</p>
            <p>{{settings.footer_paragraph_3}}</p>
            <p class="footer-donation">
              <a
                class="inline"
                href="https://freecodecamp.org/donate"
                rel="noopener noreferrer"
                target="_blank"
              >{{settings.footer_donation_cta}}</a>
            </p>
          </div>

          <div class="trending-guides">
            <h2 class="col-header" id="trending-guides">
              {{settings.footer_columns_header}}
            </h2>
            <ul
              aria-labelledby="trending-guides"
              class="trending-guides-articles"
            >
              {{#each this.guides as |guide|}}
                <li>
                  <a
                    href={{guide.href}}
                    rel="noopener noreferrer"
                    target="_blank"
                  >
                    {{guide.title}}
                  </a>
                </li>
              {{/each}}
            </ul>
          </div>
        </div>

        <div class="footer-bottom">
          <h2 class="col-header" id="our-nonprofit">
            {{settings.footer_our_org_header}}
          </h2>
          <div class="footer-divider"></div>
          <nav aria-labelledby="our-nonprofit" class="our-nonprofit">
            {{#each this.nonprofitLinks as |link|}}
              <a
                href={{link.href}}
                rel={{if link.newTab "noopener noreferrer"}}
                target={{if link.newTab "_blank"}}
              >{{link.title}}</a>
            {{/each}}
          </nav>
        </div>
      </div>
    </footer>
  </template>
}
