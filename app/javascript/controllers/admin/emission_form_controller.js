import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['socialNetworkFieldset', 'membreEquipeFieldset'];

  createNewAccountForm(event) {
    event.preventDefault();

    const newFieldSet = this.socialNetworkFieldsetTarget.cloneNode(true);
    const newId = this.socialNetworkFieldsetTargets.length;

    // set newFieldSet platform field
    newFieldSet.children[0].children[0].children[0].htmlFor = `emission_social_media_accounts_attributes_${newId}_platform`;
    newFieldSet.children[0].children[0].children[1].id = `emission_social_media_accounts_attributes_${newId}_platform`;
    newFieldSet.children[0].children[0].children[1].name = `emission[social_media_accounts_attributes][${newId}][platform]`;
    newFieldSet.children[0].children[0].children[1].value = "facebook";

    // set newFieldSet name field
    newFieldSet.children[0].children[1].children[0].htmlFor = `emission_social_media_accounts_attributes_${newId}_nom`;
    newFieldSet.children[0].children[1].children[1].id = `emission_social_media_accounts_attributes_${newId}_nom`;
    newFieldSet.children[0].children[1].children[1].name = `emission[social_media_accounts_attributes][${newId}][nom]`;
    newFieldSet.children[0].children[1].children[1].value = "";

    // set newFieldSet url field
    // TODO: find a cleaner way of accessing fields with stimulus?
    newFieldSet.children[1].children[0].children[0].htmlFor = `emission_social_media_accounts_attributes_${newId}_url`;
    newFieldSet.children[1].children[0].children[1].id = `emission_social_media_accounts_attributes_${newId}_url`;
    newFieldSet.children[1].children[0].children[1].name = `emission[social_media_accounts_attributes][${newId}][url]`;
    newFieldSet.children[1].children[0].children[1].value = "";


    // // insert the newFieldSet
    this.socialNetworkFieldsetTarget.parentNode.insertBefore(newFieldSet, this.socialNetworkFieldsetTargets[this.socialNetworkFieldsetTargets.length - 1]);
  }

  createNewMembreForm(event) {
    event.preventDefault();

    const newFieldSet = this.membreEquipeFieldsetTarget.cloneNode(true);
    const newId = this.membreEquipeFieldsetTargets.length;

    // set newFieldSet nom field
    newFieldSet.children[0].children[0].children[0].htmlFor = `emission_membre_equipes_attributes_${newId}_nom`;
    newFieldSet.children[0].children[0].children[1].id = `emission_membre_equipes_attributes_0_nom`;
    newFieldSet.children[0].children[0].children[1].name = `emission[membre_equipes_attributes][${newId}][nom]`;
    newFieldSet.children[0].children[0].children[1].value = '';

    // set newFieldSet role field
    newFieldSet.children[0].children[1].children[0].htmlFor = `emission_membre_equipes_attributes_${newId}_role`;
    newFieldSet.children[0].children[1].children[1].id = `emission_membre_equipes_attributes_${newId}}_role`;
    newFieldSet.children[0].children[1].children[1].name = `emission[membre_equipes_attributes][${newId}][role]`;
    newFieldSet.children[0].children[1].children[1].value = '';

    // // insert the newFieldSet
    this.membreEquipeFieldsetTarget.parentNode.insertBefore(newFieldSet, this.membreEquipeFieldsetTargets[this.membreEquipeFieldsetTargets.length - 1]);
  }
}
