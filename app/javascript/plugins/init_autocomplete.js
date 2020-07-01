import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('client_adresse');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addresschantierInput = document.getElementById('chantier_adresse');
  if (addresschantierInput) {
    places({ container: addresschantierInput });
  }
  const addressuserInput = document.getElementById('user_adresse');
  if (addressuserInput) {
    places({ container: addressuserInput });
  }
};

export { initAutocomplete };
