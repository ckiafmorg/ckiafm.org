import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['socialNetworkFieldset'];

  createNewAccountForm(event) {
    event.preventDefault();
    const newFieldSet = this.socialNetworkFieldsetTarget.cloneNode(true);
    const newId = this.socialNetworkFieldsetTargets.length;
    // set new field set platform field
    newFieldSet.children[0].children[1].name = `emission[social_media_accounts_attributes][${newId}][platform]`;
    newFieldSet.children[0].children[1].value = "facebook";

    // set new field set url field
    // TODO: find a cleaner way of accessing fields with stimulus?
    newFieldSet.children[1].children[1].name = `emission[social_media_accounts_attributes][${newId}][url]`;
    newFieldSet.children[1].children[1].value = "";

    // insert the new field set
    this.socialNetworkFieldsetTarget.parentNode.insertBefore(newFieldSet, this.socialNetworkFieldsetTargets[0]);
  }
}
