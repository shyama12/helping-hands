import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "dateTime" ]
  connect() {
    flatpickr(this.dateTimeTarget, {
      altInput: true,
      enableTime: true
    })
  }
}
