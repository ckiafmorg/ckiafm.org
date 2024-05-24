import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['entreeTemplate', "entreeTarget"];

  newEntree(e) {
    e.preventDefault();

    const content = this.entreeTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.entreeTargetTarget.insertAdjacentHTML('beforebegin', content)
  }

  deleteEntree(e) {
    e.preventDefault();

    const wrapper = e.target.closest(".entree-feuille-route-form-wrapper");

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove();
    } else {
      wrapper.style.display = 'none';

      const input = wrapper.querySelector("input[name*='_destroy']");
      input.value = '1';
    }

  }
}
