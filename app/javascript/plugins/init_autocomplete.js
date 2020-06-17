import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('client_adresse');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
