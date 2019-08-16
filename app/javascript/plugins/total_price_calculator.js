const start_date_column = document.getElementById('booking_start_date')
const end_date_column = document.getElementById('booking_end_date')
const price = document.getElementById('price');

const total_price_completion = () => {
  start_date_column.addEventListener("mousemove", () => {
    price.innerText = '';
    const start_date = document.querySelector('input[name="booking[start_date]"').value;
    const end_date = document.querySelector('input[name="booking[end_date]"').value
    const days = (new Date(end_date).getTime() - new Date(start_date).getTime()) / (1000 * 3600 * 24);
    const warrior_price = parseInt(document.querySelector('.card-warrior-index-pricing span').innerText);
    const total_price = warrior_price * days;
    if (isNaN(total_price)) {
    return price.innerText = '0'
  } else {
  return price.innerText = total_price;
  }
  });

};

const total_price_completion_1 = () => {
end_date_column.addEventListener("mousemove", () => {
  price.innerText = '';
  const start_date = document.querySelector('input[name="booking[start_date]"').value;
  const end_date = document.querySelector('input[name="booking[end_date]"').value
  const days = (new Date(end_date).getTime() - new Date(start_date).getTime()) / (1000 * 3600 * 24) + 1;
  const warrior_price = parseInt(document.querySelector('.card-warrior-index-pricing span').innerText);
  const total_price = warrior_price * days;
  if (isNaN(total_price)) {
    return price.innerText = '0'
  } else {
  return price.innerText = total_price;
  }
});
}
export {total_price_completion}
export {total_price_completion_1}
