import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('warrior_address');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInput2 = document.getElementById('booking_place');
  if (addressInput2) {
      places({ container: addressInput2 });
  }
};

export { initAutocomplete };
