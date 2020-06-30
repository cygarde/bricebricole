import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const typedText = document.getElementById("banner-typed-text");
  if (typedText) {
    new Typed('#banner-typed-text', {
      strings: ["clients","agenda", "tâches", "priorités", "devis", "factures", "alertes"],
      typeSpeed: 60,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
