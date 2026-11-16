import { apiInitializer } from "discourse/lib/api";
import CurriculumLink from "../components/curriculum-link.gjs";
import SiteFooter from "../components/site-footer.gjs";
import SiteNav from "../components/site-nav.gjs";

export default apiInitializer((api) => {
  api.renderInOutlet("before-header-panel", CurriculumLink);
  api.renderInOutlet("above-site-header", SiteNav);
  api.renderInOutlet("below-footer", SiteFooter);
});
