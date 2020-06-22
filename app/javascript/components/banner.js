const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Clients","Agenda", "Tâches", "Priorités", "Devis", "Factures", "Alertes"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
