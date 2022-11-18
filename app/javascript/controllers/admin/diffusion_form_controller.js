import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['diffusionType', 'daySelector'];

  connect() {
    this.updateDaysSelectorAvailability();
  }

  updateDaysSelectorAvailability() {
    if(this.diffusionTypeTarget.value != "hebdomadaire") {
      this.daySelectorTargets.forEach( (el) => el.disabled = true )
    } else {
      this.daySelectorTargets.forEach( (el) => el.disabled = false )
    }
  }
}
