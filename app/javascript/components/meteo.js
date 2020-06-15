const apikey = '9126c55318ce8f47eef482e881e6846e';
const form = document.getElementById("searchform");
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const cityselect = document.getElementById("cityselect").value;

  fetch(`https://api.openweathermap.org/data/2.5/weather?q=${cityselect}&appid=${apikey}&units=metric`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const main = data.weather[0].main;
      const description = data.weather[0].description;
      const icon = data.weather[0].icon;
      const temp = data.main.temp;

      const result = document.getElementById("weather");

      result.innerText = `${main} ${description} ${icon} ${temp}`;
    });
});
