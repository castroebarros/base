import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const activeMenu = this.element.getAttribute('data-active-menu');
    if (activeMenu != '') {
      const selectedLink = this.element.querySelector("[data-nav-link=" + activeMenu + "]");
      if (selectedLink)
        selectedLink.classList.add('active');
    }
  }
}
