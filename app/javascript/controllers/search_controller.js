import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const url = new URL(window.location.href);
    if (url.searchParams.get('q')) {
      const input = this.element.querySelector("input");
      input.focus();

      // Coloca o cursor no final da caixa de pesquisa.
      // Ref: https://stackoverflow.com/questions/511088/use-javascript-to-place-cursor-at-end-of-text-in-text-input-element
      input.focus(); //sets focus to element
      var val = input.value; //store the value of the element
      input.value = ''; //clear the value of the element
      input.value = val; //set that value back.;
    }
  }
}
