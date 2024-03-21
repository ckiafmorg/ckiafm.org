import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['equipeTemplate', 'equipeTarget', 'mediaSociauxTemplate', 'mediaSociauxTarget'];

  addMediaSociaux(e) {
    e.preventDefault();

    const content = this.mediaSociauxTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.mediaSociauxTargetTarget.insertAdjacentHTML('beforebegin', content)
  }

  deleteMediaSociaux(e) {
    e.preventDefault();

    const wrapper = e.target.closest(".media-sociaux-form-wrapper");

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove();
    } else {
      wrapper.style.display = 'none';

      const input = wrapper.querySelector("input[name*='_destroy']");
      input.value = '1';
    }
  }

  newMembre(e) {
    e.preventDefault();

    const content = this.equipeTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.equipeTargetTarget.insertAdjacentHTML('beforebegin', content)
  }

  deleteMembre(e) {
    e.preventDefault();

    const wrapper = e.target.closest(".membre-equipe-form-wrapper");

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove();
    } else {
      wrapper.style.display = 'none';

      const input = wrapper.querySelector("input[name*='_destroy']");
      input.value = '1';
    }
  }
}
