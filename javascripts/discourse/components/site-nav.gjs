import Component from "@glimmer/component";
import { service } from "@ember/service";
import getURL from "discourse/lib/get-url";

export default class SiteNav extends Component {
  @service siteSettings;

  get homeUrl() {
    return getURL("/");
  }

  <template>
    <nav aria-label="freeCodeCamp" class="site-nav nav-padding">
      <div class="site-nav-logo">
        <a href={{this.homeUrl}}>
          {{#if this.siteSettings.site_logo_url}}
            <img
              alt={{this.siteSettings.title}}
              class="logo-big"
              src={{this.siteSettings.site_logo_url}}
            />
          {{else}}
            {{this.siteSettings.title}}
          {{/if}}
        </a>
      </div>
    </nav>
  </template>
}
