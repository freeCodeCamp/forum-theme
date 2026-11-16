import Component from "@glimmer/component";
import { service } from "@ember/service";

export default class CurriculumLink extends Component {
  @service discovery;
  @service site;

  get label() {
    return this.site.mobileView
      ? settings.curriculum_title_short
      : settings.curriculum_title;
  }

  get href() {
    const base = settings.curriculum_src;
    const categorySlug = this.discovery.category?.slug?.toLowerCase();

    if (!categorySlug) {
      return base;
    }

    // The existing list settings pair forum and curriculum slugs by position.
    const languageIndex = settings.languages
      .split("|")
      .findIndex((language) => language.trim().toLowerCase() === categorySlug);
    const curriculumSlugs = settings.curriculum_slug.split("|");
    const curriculumSlug = curriculumSlugs[languageIndex]?.trim();

    if (!curriculumSlug) {
      return base;
    }

    try {
      return new URL(curriculumSlug, base).href;
    } catch {
      return base;
    }
  }

  <template>
    <a class="curriculum-nav" href={{this.href}}>{{this.label}}</a>
  </template>
}
