import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["clients","agenda", "tâches", "priorités", "devis", "factures", "alertes"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
